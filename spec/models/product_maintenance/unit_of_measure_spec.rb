require 'rails_helper'

module ProductMaintenance
  RSpec.describe UnitOfMeasure, :type => :model do
    it { should validate_presence_of(:abbreviation) }
    it { should validate_presence_of(:desc) }
    it { should validate_uniqueness_of(:abbreviation).scoped_to(:product_id).case_insensitive }
  end
end
