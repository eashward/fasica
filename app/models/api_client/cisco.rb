# frozen_string_literal: true

module ApiClient
  class Cisco < Base
    def initialize(opts = {})
      super(opts)
    end

    def amps
      response = get
      parse_response(response)
    end

    def parse_response(response)
      JSON.parse(response.body)
    end
  end
end
