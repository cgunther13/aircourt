require 'rails_helper'

RSpec.describe VistorReviewResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'vistor_reviews',
          attributes: { }
        }
      }
    end

    let(:instance) do
      VistorReviewResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { VistorReview.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:vistor_review) { create(:vistor_review) }

    let(:payload) do
      {
        data: {
          id: vistor_review.id.to_s,
          type: 'vistor_reviews',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      VistorReviewResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { vistor_review.reload.updated_at }
      # .and change { vistor_review.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:vistor_review) { create(:vistor_review) }

    let(:instance) do
      VistorReviewResource.find(id: vistor_review.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { VistorReview.count }.by(-1)
    end
  end
end
