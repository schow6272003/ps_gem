
DEFAULT_BASE_URI = 'https://pstreet-api.herokuapp.com/'
module PSClient
  class Api < BaseApi
    def initialize(args={ :base_uri => DEFAULT_BASE_URI })
      super(args)
    end 

    def find
      begin
       response = request("/api/cbsa?cbsa_ids[]=11260")
        check_status(response)
        return Response.new(response).parse
      rescue => e
        return Response.new(e).parse_error
      end
    end 

    def find_all
    
    end 

    private      
      def check_status(response)
        return if (200..299).cover?(response.code.to_i)
        raise Error.new(response.message, response.code)
      end
  end
end 

