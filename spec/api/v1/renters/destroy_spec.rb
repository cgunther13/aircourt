require "rails_helper"

RSpec.describe "renters#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/renters/#{renter.id}"
  end

  describe "basic destroy" do
    let!(:renter) { create(:renter) }

    it "updates the resource" do
      expect(RenterResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { Renter.count }.by(-1)
      expect { renter.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
