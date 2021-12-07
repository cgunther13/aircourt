require "rails_helper"

RSpec.describe "reservations#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/reservations/#{reservation.id}", payload
  end

  describe "basic update" do
    let!(:reservation) { create(:reservation) }

    let(:payload) do
      {
        data: {
          id: reservation.id.to_s,
          type: "reservations",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(ReservationResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { reservation.reload.attributes }
    end
  end
end
