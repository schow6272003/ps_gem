require 'spec_helper'

describe PSClient::Api do
  before do
    @client = described_class.new
  end  

  describe "#find"  do
    subject {@client.find(cbsa_ids)}

    context "when valid request params" do 
      let(:cbsa_ids) { [11700]} 
    
      it "returns with 200 status code" do
        p subject
        # expect(subject.status).to eq 200
      end 
    end  
  
  end 
end