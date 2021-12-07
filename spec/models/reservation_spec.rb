require 'rails_helper'

RSpec.describe Reservation, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:vistor) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
