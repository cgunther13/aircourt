require "rails_helper"

RSpec.describe "renters#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/renters", params: params
  end

  describe "basic fetch" do
    let!(:renter1) { create(:renter) }
    let!(:renter2) { create(:renter) }

    it "works" do
      expect(RenterResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["renters"])
      expect(d.map(&:id)).to match_array([renter1.id, renter2.id])
    end
  end
end
