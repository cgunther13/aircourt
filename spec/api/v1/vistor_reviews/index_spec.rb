require 'rails_helper'

RSpec.describe "vistor_reviews#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/vistor_reviews", params: params
  end

  describe 'basic fetch' do
    let!(:vistor_review1) { create(:vistor_review) }
    let!(:vistor_review2) { create(:vistor_review) }

    it 'works' do
      expect(VistorReviewResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['vistor_reviews'])
      expect(d.map(&:id)).to match_array([vistor_review1.id, vistor_review2.id])
    end
  end
end
