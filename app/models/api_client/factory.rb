# frozen_string_literal: true

module ApiClient
  module Factory
    module_function

    # attr_accessor :user

    def cisco(user)
      byebug
      @amps ||= ApiClient::Cisco.new(
        service_uri: "https://#{user.api_client_id}:#{user.api_key}@api.amp.cisco.com"
        # headers: auth_token_header(user)
      )
    rescue StandardError => e
      raise_configuration_error(
        client_name: 'Cisco',
        error: e
      )
    end

    def self.auth_token_header(user)
      token = Base64.strict_encode64("#{user.decode_api_client_id}:#{user.decode_api_client_id}")
      { Authorization: "Basic #{token}" }
    end

    # TODO: fail gracefully
    def self.raise_configuration_error(client_name:, error:)
      raise error
    end
  end
end
