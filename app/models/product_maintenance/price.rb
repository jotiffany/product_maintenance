module ProductMaintenance
  class Price < ActiveRecord::Base
    belongs_to :product

    validates :amount, :effective_date, :presence => true
    validates :effective_date, :uniqueness => { :scope => :product_id }

    def self.max_effective_date_as_of(parameter_date, product)
      select('MAX(effective_date) AS effective_date')
        .where('effective_date <= :parameter_date AND '\
             'product_id = :product_id',
               :parameter_date => parameter_date,
               :product_id => product.id)
    end

    def self.effective_as_of(parameter_date, product)
      where('product_id = :product_id AND '\
            "effective_date = (#{max_effective_date_as_of(parameter_date, product).to_sql})",
            :product_id => product.id)
        .take
    end
  end
end
