require "rails_helper"

RSpec.describe VistorReviewResource, type: :resource do
  describe "serialization" do
    let!(:vistor_review) { create(:vistor_review) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(vistor_review.id)
      expect(data.jsonapi_type).to eq("vistor_reviews")
    end
  end

  describe "filtering" do
    let!(:vistor_review1) { create(:vistor_review) }
    let!(:vistor_review2) { create(:vistor_review) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: vistor_review2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([vistor_review2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:vistor_review1) { create(:vistor_review) }
      let!(:vistor_review2) { create(:vistor_review) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      vistor_review1.id,
                                      vistor_review2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      vistor_review2.id,
                                      vistor_review1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
