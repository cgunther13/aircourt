require "rails_helper"

RSpec.describe "renters#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/renters/#{renter.id}", payload
  end

  describe "basic update" do
    let!(:renter) { create(:renter) }

    let(:payload) do
      {
        data: {
          id: renter.id.to_s,
          type: "renters",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(RenterResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { renter.reload.attributes }
    end
  end
end
