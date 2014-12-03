require 'rails_helper'

module ProductMaintenance
  RSpec.describe PricesController, :type => :controller do

    let(:valid_attributes) do
      { :product => create(:product),
        :amount => Faker::Commerce.price,
        :effective_date => Date.today }
    end

    let(:invalid_attributes) do
      { :amount => nil, :effective_date => nil }
    end

    let(:valid_session) { {} }

    routes { ProductMaintenance::Engine.routes }

    describe 'GET new' do
      it 'assigns a new price as @price' do
        product = create(:product)
        get :new, { :product_id => product.id }, valid_session
        expect(assigns(:price)).to be_a_new(Price)
      end
    end

    describe 'GET edit' do
      it 'assigns the requested price as @price' do
        price = create(:price)
        get :edit, { :product_id => price.product.id, :id => price.to_param }, valid_session
        expect(assigns(:price)).to eq(price)
      end
    end

    describe 'POST create' do
      describe 'with valid params' do
        it 'creates a new Price' do
          expect do
            puts valid_attributes
            post :create, { :product_id => valid_attributes[:product].id,
                            :price => valid_attributes }, valid_session
          end.to change(Price, :count).by(1)
        end

        it 'assigns a newly created price as @price' do
          post :create, { :product_id => valid_attributes[:product].id,
                          :price => valid_attributes }, valid_session
          expect(assigns(:price)).to be_a(Price)
          expect(assigns(:price)).to be_persisted
        end

        it 'redirects to the product page' do
          post :create, { :product_id => valid_attributes[:product].id,
                          :price => valid_attributes }, valid_session
          expect(response).to redirect_to(product_path(valid_attributes[:product]))
        end
      end

      describe 'with invalid params' do
        it 'assigns a newly created but unsaved price as @price' do
          post :create, { :product_id => valid_attributes[:product][:id],
                          :price => invalid_attributes }, valid_session
          expect(assigns(:price)).to be_a_new(Price)
        end

        it "re-renders the 'new' template" do
          post :create, { :product_id => valid_attributes[:product][:id],
                          :price => invalid_attributes }, valid_session
          expect(response).to render_template('new')
        end
      end
    end

    describe 'PUT update' do
      describe 'with valid params' do
        let(:new_attributes) do
          { :amount => 10, :effective_date => Date.yesterday }
        end

        it 'updates the requested price' do
          price = create(:price)
          put :update, { :product_id => valid_attributes[:product][:id],
                         :id => price.to_param, :price => new_attributes }, valid_session
          price.reload
          expect(price.amount).to be_eql(new_attributes[:amount])
          expect(price.effective_date).to be_eql(new_attributes[:effective_date])
        end

        it 'assigns the requested price as @price' do
          price = create(:price)
          put :update, { :product_id => valid_attributes[:product][:id],
                         :id => price.to_param, :price => valid_attributes }, valid_session
          expect(assigns(:price)).to eq(price)
        end

        it 'redirects to the price' do
          price = create(:price)
          put :update, { :product_id => valid_attributes[:product][:id],
                         :id => price.to_param, :price => valid_attributes }, valid_session
          expect(response).to redirect_to(product_path(valid_attributes[:product]))
        end
      end

      describe 'with invalid params' do
        it 'assigns the price as @price' do
          price = create(:price)
          put :update, { :product_id => valid_attributes[:product][:id],
                         :id => price.to_param, :price => invalid_attributes }, valid_session
          expect(assigns(:price)).to eq(price)
        end

        it "re-renders the 'edit' template" do
          price = create(:price)
          put :update, { :product_id => valid_attributes[:product][:id],
                         :id => price.to_param, :price => invalid_attributes }, valid_session
          expect(response).to render_template('edit')
        end
      end
    end

    describe 'DELETE destroy' do
      it 'destroys the requested price' do
        price = create(:price)
        expect do
          delete :destroy, { :product_id => price.product,
           :id => price.to_param }, valid_session
        end.to change(Price, :count).by(-1)
      end

      it 'redirects to the prices list' do
        price = create(:price)
        delete :destroy, { :product_id => price.product,
         :id => price.to_param }, valid_session
        expect(response).to redirect_to(product_path(price.product))
      end
    end

  end
end
