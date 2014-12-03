FactoryGirl.define do
  factory :product_maintenance_conversion_factor, :class => 'ProductMaintenance::ConversionFactor' do
    factor '9.99'
    abbreviation 'MyString'
    desc 'MyString'
    unit_of_measure nil
  end

end
