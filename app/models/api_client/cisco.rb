# frozen_string_literal: true

module ApiClient
  class Cisco < Base
    def initialize(opts = {})
      super(opts)
    end

    def amps
      response = connection(base_path: '/v1/computers').get
      handle_response(response)
    end

    def amps_by_connector_guid(uuid:)
      response = connection(
        base_path: "/v1/computers/#{uuid}"
      ).get
      byebug
      handle_response(response)
    end

    def device_rajectory(uuid:)
      response = connection(
        base_path: "/v1/computers/#{uuid}/trajectory"
      ).get
      handle_response(response)
    end

    def vulnerabilities_by_cnctr_guid(uuid:)
      response = connection(
        base_path: "/v1/computers/#{uuid}/vulnerabilities"
      ).get
      handle_response(response)
    end

    def computer_activity
      q = 'SearchProtocolHost.exe'
      limit = 5
      response = connection(
        base_path: "/v1/computers/activity?q=#{q}&limit=#{limit}"
      )
      handle_response(response)
    end
  end
end
