ProductMaintenance::Engine.routes.draw do
  resources :products do
    resources :prices, :only => [:new, :edit, :create, :update, :destroy]
    resources :conversion_factors, :only => [:index, :new, :edit, :create, :update, :destroy]
  end

end
