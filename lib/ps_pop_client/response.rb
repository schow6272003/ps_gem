module PSClient
    require 'json'
    
    class Response
        def initialize(response= {})
            @response=response
        end 

        def parse
            { status: @response.code, body: JSON.parse(@response.body)}
        end 

        def parse_error
            { status: @response.code,  message: @response.message}
        end 
    end
end 