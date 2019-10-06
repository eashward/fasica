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

    def get_2

    end
    def get_3

    end

    def get_6

    end

    def get_4

    end

    def get_5

    end


    def parse_response(response)
      JSON.parse(response.body)
    end
  end
end
