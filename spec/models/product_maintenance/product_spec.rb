require 'rails_helper'

module ProductMaintenance
  RSpec.describe Product, :type => :model do
    it { should validate_presence_of(:code) }
    it { should validate_presence_of(:desc) }
    it { should validate_uniqueness_of(:code) }

    describe 'should validate expiration date' do
      it 'returns valid if expiration is after effective date' do
        product = build(:product,
                        :effective_date => Date.yesterday,
                        :expiration_date => Date.tomorrow)
        expect(product).to be_valid
        expect(product.errors[:expiration_date]).to be_blank
      end

      it 'returns invalid if expiration is before effective date' do
        product = build(:product,
                        :effective_date => Date.tomorrow,
                        :expiration_date => Date.yesterday)
        expect(product).not_to be_valid
        expect(product.errors[:expiration_date]).not_to be_blank
      end
    end

    describe 'check for effectiveness' do
      it 'is effective if the date is currently or before today' do
        product = create(:product, :effective_date => Date.yesterday)
        expect(product.effective?).to be_eql true
        product.effective_date = Date.today
        expect(product.effective?).to be_eql true
      end

      it 'is not effective if the date is after today' do
        product = create(:product, :effective_date => Date.tomorrow)
        expect(product.effective?).to be_eql false
      end
    end

    describe 'check for expiration' do
      it 'is expired if the date is after today' do
        product = create(:product, :expiration_date => Date.tomorrow)
        expect(product.expired?).to be_eql true
      end

      it 'is not effective if the date is currently or before today' do
        product = create(:product, :expiration_date => Date.yesterday)
        expect(product.expired?).to be_eql false
        product.expiration_date = Date.today
        expect(product.expired?).to be_eql false
      end
    end
  end
end
