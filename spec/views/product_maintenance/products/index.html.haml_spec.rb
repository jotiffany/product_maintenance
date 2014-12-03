require 'rails_helper'
include ProductMaintenance::Engine.routes.url_helpers

RSpec.describe 'product_maintenance/products/index', :type => :view do
  before(:each) do
    assign(:products, [
      create(:product, :code => 'PR 1', :desc => 'Product 1'),
      create(:product, :code => 'PR 2', :desc => 'Product 2')
    ])
  end

  it 'renders a list of products' do
    render
    assert_select 'tr>td', :text => 'PR 1'.to_s, :count => 1
    assert_select 'tr>td', :text => 'PR 2'.to_s, :count => 1
    assert_select 'tr>td', :text => 'Product 1'.to_s, :count => 1
    assert_select 'tr>td', :text => 'Product 2'.to_s, :count => 1
  end
end
