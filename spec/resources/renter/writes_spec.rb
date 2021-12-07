require 'rails_helper'

RSpec.describe RenterResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'renters',
          attributes: { }
        }
      }
    end

    let(:instance) do
      RenterResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Renter.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:renter) { create(:renter) }

    let(:payload) do
      {
        data: {
          id: renter.id.to_s,
          type: 'renters',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      RenterResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { renter.reload.updated_at }
      # .and change { renter.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:renter) { create(:renter) }

    let(:instance) do
      RenterResource.find(id: renter.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Renter.count }.by(-1)
    end
  end
end
