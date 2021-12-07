require 'rails_helper'

RSpec.describe "court_reviews#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/court_reviews/#{court_review.id}", payload
  end

  describe 'basic update' do
    let!(:court_review) { create(:court_review) }

    let(:payload) do
      {
        data: {
          id: court_review.id.to_s,
          type: 'court_reviews',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(CourtReviewResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { court_review.reload.attributes }
    end
  end
end
