require 'rails_helper'

module ProductMaintenance
  RSpec.describe ProductsController, :type => :routing do
    describe 'routing' do

      routes { ProductMaintenance::Engine.routes }

      it 'routes to #index' do
        expect(:get => 'products').to route_to(:controller => 'product_maintenance/products',
                                               :action => 'index')
      end

      it 'routes to #new' do
        expect(:get => 'products/new').to route_to(:controller => 'product_maintenance/products',
                                                   :action => 'new')
      end

      it 'routes to #show' do
        expect(:get => 'products/1').to route_to(:controller => 'product_maintenance/products',
                                                 :action => 'show', :id => '1')
      end

      it 'routes to #edit' do
        expect(:get => 'products/1/edit').to route_to(:controller => 'product_maintenance/products',
                                                      :action => 'edit', :id => '1')
      end

      it 'routes to #create' do
        expect(:post => 'products').to route_to(:controller => 'product_maintenance/products',
                                                :action => 'create')
      end

      it 'routes to #update' do
        expect(:put => 'products/1').to route_to(:controller => 'product_maintenance/products',
                                                 :action => 'update', :id => '1')
      end

      it 'routes to #destroy' do
        expect(:delete => 'products/1').to route_to(:controller => 'product_maintenance/products',
                                                    :action => 'destroy', :id => '1')
      end

    end
  end
end
