# frozen_string_literal: true
require 'net/http'

class IdentifierValidator < ActiveModel::EachValidator
  class NpiServiceUnavailableError < StandardError; end

  def validate_each(record, attribute, value)
    response_body = request_provider(value)
    response_body['Errors'].presence&.each do |error|
      add_error(record, attribute, error['description']&.downcase)
    end
    return unless record.errors[attribute].empty?
    return add_error(record, attribute) if response_with_no_results?(response_body)

    record.data = response_body['results'].pop
  rescue ActiveModel::MissingAttributeError => e
    Rails.logger.warn e
  end

  private

  def request_provider(number)
    uri = URI.parse("https://npiregistry.cms.hhs.gov/api/?version=2.1&number=#{number}")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Get.new(uri)
    request.add_field('Accept', 'application/json')
    response = http.request(request)
    if response.is_a?(Net::HTTPServiceUnavailable) || response.code == '503'
      raise NpiServiceUnavailableError, I18n.t('errors.npi.service_unavailable')
    end

    ActiveSupport::JSON.decode(response.body)
  end

  def response_with_no_results?(response_body)
    response_body['result_count'].zero? || response_body['results'].empty?
  end

  def add_error(record, attribute, message = options[:message] || I18n.t('errors.npi.invalid_number'))
    record.errors.add attribute, message
  end
end
