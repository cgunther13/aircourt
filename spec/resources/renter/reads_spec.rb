require "rails_helper"

RSpec.describe RenterResource, type: :resource do
  describe "serialization" do
    let!(:renter) { create(:renter) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(renter.id)
      expect(data.jsonapi_type).to eq("renters")
    end
  end

  describe "filtering" do
    let!(:renter1) { create(:renter) }
    let!(:renter2) { create(:renter) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: renter2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([renter2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:renter1) { create(:renter) }
      let!(:renter2) { create(:renter) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      renter1.id,
                                      renter2.id,
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
                                      renter2.id,
                                      renter1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
