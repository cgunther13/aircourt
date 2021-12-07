require 'rails_helper'

RSpec.describe Court, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:reservations) }

    it { should belong_to(:renter) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    it { should validate_presence_of(:court_type) }

    it { should validate_presence_of(:location) }

    it { should validate_numericality_of(:max_guests).is_greater_than(0) }

    end
end
