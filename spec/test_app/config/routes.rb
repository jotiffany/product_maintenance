Rails.application.routes.draw do

  mount ProductMaintenance::Engine => '/product_maintenance'
end
