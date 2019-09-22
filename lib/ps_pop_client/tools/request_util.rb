module RequestUtil
 require_relative '../error'
 def self.validate_find_request(req)
  if !req.kind_of?(Hash) 
   raise PSClient::Error.new("Bad Request", 400)
  elsif !req.keys.include?(:cbsa_ids) && !req.keys.include?(:zip_codes) && !req.keys.include?(:name)
   raise PSClient::Error.new("Bad Request", 400)
  elsif (req.keys.include?(:cbsa_ids) && !req[:cbsa_ids].kind_of?(Array)) || (req.keys.include?(:zip_codes) && !req[:zip_codes].kind_of?(Array)) || (req.keys.include?(:name) && !req[:name].kind_of?(String))
   raise PSClient::Error.new("Bad Request", 400)
  end 
 end 
 def self.parse_to_symbol(req)
   raise PSClient::Error.new("Bad Request", 400) if !req.kind_of?(Hash) 
   Hash[req.map{|(k,v)| [k.to_sym,v]}]
 end 
end  