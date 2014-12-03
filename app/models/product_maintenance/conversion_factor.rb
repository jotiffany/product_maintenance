module ProductMaintenance
  class ConversionFactor < ActiveRecord::Base
    belongs_to :unit_of_measure

    validates :factor, :abbreviation, :desc, :presence => true
    validates :abbreviation, :uniqueness => { :scope => :unit_of_measure_id,
                                              :case_sensitive => false }
  end
end
