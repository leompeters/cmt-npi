# frozen_string_literal: true

if defined?(MetaRequest) && MetaRequest::Event.private_instance_methods(false).exclude?(:not_encodable?)
  MetaRequest::Event.class_eval do
    private

    def json_encodable(payload)
      return {} unless payload.is_a?(Hash)

      transform_hash(payload, deep: true) do |hash, key, value|
        if value.class.to_s == 'ActionDispatch::Http::Headers'
          value = value.to_h.select { |k, _| k.upcase == k }
        elsif not_encodable?(value)
          value = self.class.const_get(:NOT_JSON_ENCODABLE)
        end

        begin
          value.to_json(methods: [:duration])
          new_value = value
        rescue StandardError
          new_value = self.class.const_get(:NOT_JSON_ENCODABLE)
        end
        hash[key] = new_value
      end.with_indifferent_access
    end

    def not_encodable?(value)
      (defined?(ActiveRecord) && value.is_a?(ActiveRecord::ConnectionAdapters::AbstractAdapter)) ||
        (defined?(ActionDispatch) &&
          (value.is_a?(ActionDispatch::Request) || value.is_a?(ActionDispatch::Response)))
    end
  end
end
