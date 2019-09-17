module PSClient 
 class Error < StandardError
   attr_reader :code
    def initialize(message = nil, response = nil)
        super(message)
        @code = (response.encode) ? response.encode : 500
    end
 end
end