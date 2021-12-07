require 'rails_helper'

RSpec.describe Visitor, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:reservations) }

    end

    describe "InDirect Associations" do

    it { should have_many(:courts_played_at) }

    it { should have_many(:court_reviews) }

    end

    describe "Validations" do

    it { should validate_uniqueness_of(:email) }

    it { should validate_presence_of(:email) }

    it { should validate_presence_of(:password) }

    it { should validate_uniqueness_of(:username) }

    it { should validate_presence_of(:username) }

    end
end
