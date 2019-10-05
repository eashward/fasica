# frozen_string_literal: true

module ApiClient
  class Base
    attr_accessor :service_uri, :timeout, :base_path, :headers, :parameters, :api_version_uri
    delegate :get, :post, :put, :patch, :delete, to: :connection

    DEFAULT_TIMEOUT_IN_SECONDS = 3

    def initialize(service_uri:,
                   base_path: '/',
                   headers: {},
                   parameters: {},
                   timeout: DEFAULT_TIMEOUT_IN_SECONDS)
      @timeout = timeout
      @service_uri = service_uri
      @base_path = base_path
      @headers = default_headers.merge(headers)
      @parameters = parameters
    end

    def connection
      @connection ||= new_Connection(uri: api_version_uri)
    end

    def log_responses(faraday:)
      faraday.response :logger, Rails.logger, bodies: true do |logger|
        logger.filter(/(authorization\s*:\s*)(?:"|')?(?:.*?)(?:'|")?.*/i, '\1[REMOVED]')
      end
    end

    def default_headers
      {
        'Accept' => 'application/json',
        'Content-Type' => 'application/json'
      }
    end

    private

    def new_Connection(uri:)
      byebug
      Faraday.new(url: uri) do |faraday|
        faraday.request :url_encoded
        faraday.options[:timeout] = timeout
        faraday.headers.merge!(parameters)
        # faraday.use :instrumentation

        # NOTE: do not put anything after the following lines (and keep order)
        log_responses(faraday: faraday)
        # NOTE: Must be put after middleware uses
        faraday.adapter Faraday.default_adapter
      end
    end

    def api_version_uri
      @api_version_uri ||= URI.join(service_uri, base_path)
    end
  end
end
