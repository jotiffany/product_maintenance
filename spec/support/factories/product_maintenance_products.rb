FactoryGirl.define do
  factory :product, :class => 'ProductMaintenance::Product' do
    sequence(:code) { |n| "product_#{n}" }
    desc Faker::Commerce.product_name
    subtype 'Good'
    effective_date Date.new(2014, 1, 1)
    expiration_date Date.new(2014, 12, 31)
  end

end
