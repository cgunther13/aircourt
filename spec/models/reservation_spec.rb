require "rails_helper"

RSpec.describe Reservation, type: :model do
  describe "Direct Associations" do
    it { should have_many(:vistor_reviews) }

    it { should have_many(:court_reviews) }

    it { should belong_to(:court) }

    it { should belong_to(:vistor) }
  end

  describe "InDirect Associations" do
    it { should have_one(:renter) }
  end

  describe "Validations" do
  end
end
