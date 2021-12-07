require "rails_helper"

RSpec.describe "reservations#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/reservations/#{reservation.id}"
  end

  describe "basic destroy" do
    let!(:reservation) { create(:reservation) }

    it "updates the resource" do
      expect(ReservationResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { Reservation.count }.by(-1)
      expect { reservation.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
