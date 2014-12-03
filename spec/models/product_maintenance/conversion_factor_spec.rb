require 'rails_helper'

module ProductMaintenance
  RSpec.describe ConversionFactor, :type => :model do
    it { should validate_presence_of(:abbreviation) }
    it { should validate_presence_of(:desc) }
    it { should validate_uniqueness_of(:abbreviation).scoped_to(:unit_of_measure_id).case_insensitive }
  end
end
