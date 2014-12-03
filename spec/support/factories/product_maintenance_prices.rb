FactoryGirl.define do
  factory :price, :class => 'ProductMaintenance::Price' do
    association :product, :factory => :product
    amount Faker::Commerce.price
    effective_date Date.new(2014, 1, 1)
  end

end
