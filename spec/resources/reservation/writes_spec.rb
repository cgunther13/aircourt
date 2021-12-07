require "rails_helper"

RSpec.describe ReservationResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "reservations",
          attributes: {},
        },
      }
    end

    let(:instance) do
      ReservationResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { Reservation.count }.by(1)
    end
  end

  describe "updating" do
    let!(:reservation) { create(:reservation) }

    let(:payload) do
      {
        data: {
          id: reservation.id.to_s,
          type: "reservations",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      ReservationResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { reservation.reload.updated_at }
      # .and change { reservation.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:reservation) { create(:reservation) }

    let(:instance) do
      ReservationResource.find(id: reservation.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { Reservation.count }.by(-1)
    end
  end
end
