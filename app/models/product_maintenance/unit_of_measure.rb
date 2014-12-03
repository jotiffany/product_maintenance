module ProductMaintenance
  class UnitOfMeasure < ActiveRecord::Base
    belongs_to :product
    has_many :conversion_factors

    validates :abbreviation, :desc, :presence => true
    validates :abbreviation, :uniqueness => { :scope => :product_id,
                                              :case_sensitive => false }
  end
end
