module PSClient
    require 'json'
    require_relative 'tools/error_util'
    class Response
        def initialize(response= {})
            @response=response
        end 

        def parse
            { status: @response.code, body: JSON.parse(@response.body)}
        end 

        def parse_error
            ErrorUtil.parse_response(@response);
        end 
    end
end 