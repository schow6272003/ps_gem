require File.expand_path("../lib/ps_pop_client/version", __FILE__)

Gem::Specification.new do |s|
  s.name        = 'ps_pop_client'
  s.version     = PSClient::VERSION
  s.date        = '2019-09-16'
  s.summary     = "API To fetch population growth on CBSA"
  s.description = "Ruby Client to interact with CBSA api as described on PeerStreet take home assignment."
  s.authors     = ["Steven Chow"]
  s.email       = 'stevenwchow@gmail.com'
  s.files       =  ['lib/ps_pop_client.rb', 
                    'lib/ps_pop_client/base_client.rb',
                    'lib/ps_pop_client/client.rb',
                    'lib/ps_pop_client/error.rb',
                    'lib/ps_pop_client/request.rb',
                    'lib/ps_pop_client/response.rb',
                    'lib/ps_pop_client/version.rb']
  s.require_paths = ['lib']
  s.homepage    = 'https://github.com/schow6272003/ps_gem'
  s.license       = 'MIT'
  s.add_dependency 'json'
  s.add_development_dependency 'rspec'
end
