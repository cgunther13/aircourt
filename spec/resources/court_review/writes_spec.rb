require "rails_helper"

RSpec.describe CourtReviewResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "court_reviews",
          attributes: {},
        },
      }
    end

    let(:instance) do
      CourtReviewResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { CourtReview.count }.by(1)
    end
  end

  describe "updating" do
    let!(:court_review) { create(:court_review) }

    let(:payload) do
      {
        data: {
          id: court_review.id.to_s,
          type: "court_reviews",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      CourtReviewResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { court_review.reload.updated_at }
      # .and change { court_review.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:court_review) { create(:court_review) }

    let(:instance) do
      CourtReviewResource.find(id: court_review.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { CourtReview.count }.by(-1)
    end
  end
end
