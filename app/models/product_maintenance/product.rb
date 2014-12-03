module ProductMaintenance
  class Product < ActiveRecord::Base
    has_one :base_unit, :class => UnitOfMeasure
    has_many :prices
    has_many :conversion_factors, :through => :base_unit

    accepts_nested_attributes_for :base_unit

    validates :code, :desc, :presence => true
    validates :code, :uniqueness => true
    validate :expiration_date_after_effective_date
    validates_associated :base_unit

    def expiration_date_after_effective_date
      return unless effective_date.present? && expiration_date.present?
      error_message = 'must be after the effective date.'
      errors.add(:expiration_date, error_message) if expiration_date <= effective_date
    end

    def effective?
      effective_date <= Date.today unless effective_date.blank?
    end

    def expired?
      expiration_date > Date.today unless expiration_date.blank?
    end

    def current_price
      Price.effective_as_of(Date.current, self)
    end

    def current_price_amount
      current_price ? current_price.amount : 0
    end
  end
end
