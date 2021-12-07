require "rails_helper"

RSpec.describe ReservationResource, type: :resource do
  describe "serialization" do
    let!(:reservation) { create(:reservation) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(reservation.id)
      expect(data.jsonapi_type).to eq("reservations")
    end
  end

  describe "filtering" do
    let!(:reservation1) { create(:reservation) }
    let!(:reservation2) { create(:reservation) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: reservation2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([reservation2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:reservation1) { create(:reservation) }
      let!(:reservation2) { create(:reservation) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      reservation1.id,
                                      reservation2.id,
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
                                      reservation2.id,
                                      reservation1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
