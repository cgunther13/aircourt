require 'rails_helper'

RSpec.describe Renter, type: :model do
  
    describe "Direct Associations" do

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    it { should validate_uniqueness_of(:email) }

    it { should validate_presence_of(:email) }

    it { should validate_presence_of(:password) }

    it { should validate_uniqueness_of(:username) }

    it { should validate_presence_of(:username) }

    end
end
