require 'rails_helper'
include ProductMaintenance::Engine.routes.url_helpers

RSpec.describe 'product_maintenance/products/edit', :type => :view do
  before(:each) do
    @product = assign(:product, create(:product))
  end

  it 'renders the edit product form' do
    render

    assert_select 'form[action=?][method=?]', product_path(@product), 'post' do

      assert_select 'input#product_code[name=?]', 'product[code]'

      assert_select 'input#product_desc[name=?]', 'product[desc]'

      assert_select 'input#product_subtype[name=?]', 'product[subtype]'

      assert_select 'input#product_category_code[name=?]', 'product[category_code]'

      assert_select 'textarea#product_comment[name=?]', 'product[comment]'
    end
  end
end
