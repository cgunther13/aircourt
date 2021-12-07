require "rails_helper"

RSpec.describe "renters#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/renters/#{renter.id}", params: params
  end

  describe "basic fetch" do
    let!(:renter) { create(:renter) }

    it "works" do
      expect(RenterResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("renters")
      expect(d.id).to eq(renter.id)
    end
  end
end
