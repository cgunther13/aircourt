require 'rails_helper'

RSpec.describe CourtReviewResource, type: :resource do
  describe 'serialization' do
    let!(:court_review) { create(:court_review) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(court_review.id)
      expect(data.jsonapi_type).to eq('court_reviews')
    end
  end

  describe 'filtering' do
    let!(:court_review1) { create(:court_review) }
    let!(:court_review2) { create(:court_review) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: court_review2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([court_review2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:court_review1) { create(:court_review) }
      let!(:court_review2) { create(:court_review) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            court_review1.id,
            court_review2.id
          ])
        end
      end

      context 'when descending' do
        before do
          params[:sort] = '-id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            court_review2.id,
            court_review1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
