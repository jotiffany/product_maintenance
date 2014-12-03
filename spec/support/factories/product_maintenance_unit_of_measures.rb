FactoryGirl.define do
  factory :unit_of_measure, :class => 'ProductMaintenance::UnitOfMeasure' do
    abbreviation 'piece'
    desc 'Piece'
    association :product, :factory => :product
  end
end
