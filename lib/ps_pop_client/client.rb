
DEFAULT_BASE_URI = 'https://pstreet-api.herokuapp.com/'
module PSClient
  class Api < BaseApi
    def initialize(args={ :base_uri => DEFAULT_BASE_URI })
      super(args)
    end 

    def find(req={}) 
      begin
        check_request(req)
       uri = encode_uri(req)
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
        if !req[:cbsa_ids] && !req[:zipcodes] && !req[:name] 
          raise Error.new("Bad Request", 400)
        elsif ( req[:cbsa_ids] && !req[:cbsa_ids].kind_of?(Array)) 
              || ( req[:zipcodes] && !req[:zipcodes].kind_of?(Array))
              || ( req[:name] && req[:name].kind_of?(String)) 
          raise Error.new("Bad Request", 400)
        end 
      end 

      def encode_uri(req)
        cbsa_ids_uri = req[:cbsa_ids].inject("") { |s, a| s + "cbsa_ids[]=" + a.to_s + "&" }
        zipcodes_uri = req[:zipcodes].inject("") { |s, a| s + "zicodes[]=" + a.to_s + "&" }
        name = "name="  + rq[:name]
        "/api/cbsa?" + cbsa_ids_uri + zipcodes_uri + name
      end 
  end
end 

