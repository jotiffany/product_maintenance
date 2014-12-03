require 'rails_helper'

module ProductMaintenance
  RSpec.describe Price, :type => :model do
    it { should validate_presence_of(:amount) }
    it { should validate_presence_of(:effective_date) }
    it { should validate_uniqueness_of(:effective_date).scoped_to(:product_id) }

    it 'should return the effective price as of a given date' do
      product = create(:product)
      old_price = create(:price, :product => product,
                                 :amount => 10,
                                 :effective_date => Date.new(2014, 1, 1))
      new_price = create(:price, :product => product,
                                 :amount => 20,
                                 :effective_date => Date.new(2014, 6, 1))

      effective_price = Price.effective_as_of(Date.today, product)
      expect(effective_price).not_to be_nil
      expect(effective_price.amount).to be_eql 20

      effective_price = Price.effective_as_of(Date.new(2014, 2, 1), product)
      expect(effective_price).not_to be_nil
      expect(effective_price.amount).to be_eql 10
    end

  end
end
