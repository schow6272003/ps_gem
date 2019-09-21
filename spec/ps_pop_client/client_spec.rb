require 'spec_helper'
require 'webmock/rspec'


describe PSClient::VERSION do
    it 'has ver. number' do 
      expect(PSClient::VERSION).not_to be_empty 
    end 
  end