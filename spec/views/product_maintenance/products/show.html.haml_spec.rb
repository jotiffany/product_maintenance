require 'rails_helper'
include ProductMaintenance::Engine.routes.url_helpers

RSpec.describe 'product_maintenance/products/show', :type => :view do
  before(:each) do
    @product = assign(:product, create(:product))
    @product.base_unit = create(:unit_of_measure, :product => @product)
    puts @product
  end

  it 'renders attributes' do
    render
    expect(rendered).to match(/Code/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/Subtype/)
    expect(rendered).to match(/Category code/)
    expect(rendered).to match(/Comment/)
  end
end
