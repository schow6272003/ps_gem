
DEFAULT_BASE_URI = 'https://pstreet-api.herokuapp.com/'
module PSClient
  require_relative 'tools/request_util'
  class Api < BaseApi
    def initialize(args={ :base_uri => DEFAULT_BASE_URI })
      super(args)
    end 

    def find(req={}) 
      begin
        req_test = {:cbsa_ids => [11700]}
        check_request(req_test)
        uri = encode_uri(req_test)
        response = request(uri)
        check_status(response)
        return Response.new(response).parse
      rescue => e
        return Response.new(e).parse_error
      end
    end 

    private      
      def check_status(response)
       return if (200..299).cover?(response.code.to_i)
       raise Error.new(response.message, response.code)
      end
      
      def check_request(req)
        RequestUtil.validate_find_request(req)
      end 

      def encode_uri(req)
        cbsa_ids_uri = req.keys.include?(:cbsa_ids) ? req[:cbsa_ids].inject("") { |s, a| s + "cbsa_ids[]=" + a.to_s + "&" } : ""
        zipcodes_uri = req.keys.include?(:zipcodes) ?  req[:zipcodes].inject("") { |s, a| s + "zicodes[]=" + a.to_s + "&" } : ""
        name = req.keys.include?(:name)  ? "name="  + req[:name] : ""
        "/api/cbsa?" + cbsa_ids_uri + zipcodes_uri + name
      end 
  end
end 

