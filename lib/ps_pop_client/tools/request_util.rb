module RequestUtil
    require_relative '../error'
    def self.validate_find_request(req)
     if !req.kind_of?(Hash) 
      raise Error.new("Bad Request", 400)
     elsif !req[:cbsa_ids].kind_of?(Array) && !req[:zipcodes].kind_of?(Array) && !req[:name].kind_of?(String) 
      raise Error.new("Bad Request", 400)
     elsif (req.keys.include?(:cbsa_ids) && !req[:cbsa_ids].kind_of?(Array))|| (req.keys.include?(:zipcodes) && !req[:zipcodes].kind_of?(Array))|| (req.keys.include?(:name) && req[:name].kind_of?(String)) 
      raise Error.new("Bad Request", 400)
     end 
    end 
end  