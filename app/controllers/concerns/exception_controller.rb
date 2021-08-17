# frozen_string_literal: true

module ExceptionController
  extend ActiveSupport::Concern

  included do
    rescue_from IdentifierValidator::NpiServiceUnavailableError, with: :service_unavailable
  end

  private

  def service_unavailable(message)
    respond_to do |format|
      format.json { render status: :service_unavailable, json: message }
    end
  end
end
