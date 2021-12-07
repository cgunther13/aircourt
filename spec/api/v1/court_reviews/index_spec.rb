require 'rails_helper'

RSpec.describe "court_reviews#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/court_reviews", params: params
  end

  describe 'basic fetch' do
    let!(:court_review1) { create(:court_review) }
    let!(:court_review2) { create(:court_review) }

    it 'works' do
      expect(CourtReviewResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['court_reviews'])
      expect(d.map(&:id)).to match_array([court_review1.id, court_review2.id])
    end
  end
end
