require 'rails_helper'

RSpec.describe "reservations#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/reservations/#{reservation.id}", params: params
  end

  describe 'basic fetch' do
    let!(:reservation) { create(:reservation) }

    it 'works' do
      expect(ReservationResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('reservations')
      expect(d.id).to eq(reservation.id)
    end
  end
end
