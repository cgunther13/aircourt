require 'rails_helper'

RSpec.describe "court_reviews#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/court_reviews/#{court_review.id}", params: params
  end

  describe 'basic fetch' do
    let!(:court_review) { create(:court_review) }

    it 'works' do
      expect(CourtReviewResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('court_reviews')
      expect(d.id).to eq(court_review.id)
    end
  end
end
