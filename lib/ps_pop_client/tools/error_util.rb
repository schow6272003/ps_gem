module ErrorUtil
  def self.parse_response(e)
     response = {
       status: (e.class == PSClient::Error) ?  e.code : 500,
       message: e.message
     }
    return response
  end 
end 