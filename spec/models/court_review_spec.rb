require "rails_helper"

RSpec.describe CourtReview, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:reservation) }
  end

  describe "InDirect Associations" do
    it { should have_one(:vistor) }
  end

  describe "Validations" do
    it { should validate_presence_of(:body) }

    it {
      should validate_numericality_of(:score).is_less_than(10).is_greater_than_or_equal_to(1)
    }
  end
end
