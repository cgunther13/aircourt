require 'rails_helper'

RSpec.describe "vistor_reviews#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/vistor_reviews/#{vistor_review.id}", payload
  end

  describe 'basic update' do
    let!(:vistor_review) { create(:vistor_review) }

    let(:payload) do
      {
        data: {
          id: vistor_review.id.to_s,
          type: 'vistor_reviews',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(VistorReviewResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { vistor_review.reload.attributes }
    end
  end
end
