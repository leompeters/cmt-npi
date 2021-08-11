# frozen_string_literal: true

module Mocks
  # @see https://www.ananunesdasilva.com/posts/testing-external-apis-with-webmock
  def mocks_on
    headers = { 'Accept' => 'application/json' }
    stub_request(:any, /(.*?)/)
      .to_return(body: File.new('./spec/fixtures/npi.json'),
                 status: 200, headers: headers)
  end

  # def mocks_off; end
end
