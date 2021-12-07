require "rails_helper"

RSpec.describe "vistor_reviews#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/vistor_reviews/#{vistor_review.id}"
  end

  describe "basic destroy" do
    let!(:vistor_review) { create(:vistor_review) }

    it "updates the resource" do
      expect(VistorReviewResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { VistorReview.count }.by(-1)
      expect { vistor_review.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
