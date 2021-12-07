require 'rails_helper'

RSpec.describe "reservations#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/reservations", params: params
  end

  describe 'basic fetch' do
    let!(:reservation1) { create(:reservation) }
    let!(:reservation2) { create(:reservation) }

    it 'works' do
      expect(ReservationResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['reservations'])
      expect(d.map(&:id)).to match_array([reservation1.id, reservation2.id])
    end
  end
end
