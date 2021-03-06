require "rails_helper"

RSpec.describe "court_reviews#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/court_reviews/#{court_review.id}"
  end

  describe "basic destroy" do
    let!(:court_review) { create(:court_review) }

    it "updates the resource" do
      expect(CourtReviewResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { CourtReview.count }.by(-1)
      expect { court_review.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
