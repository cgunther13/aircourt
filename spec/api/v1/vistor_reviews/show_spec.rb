require 'rails_helper'

RSpec.describe "vistor_reviews#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/vistor_reviews/#{vistor_review.id}", params: params
  end

  describe 'basic fetch' do
    let!(:vistor_review) { create(:vistor_review) }

    it 'works' do
      expect(VistorReviewResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('vistor_reviews')
      expect(d.id).to eq(vistor_review.id)
    end
  end
end
