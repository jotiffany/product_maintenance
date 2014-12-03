require_dependency 'product_maintenance/application_controller'

module ProductMaintenance
  class ProductsController < ApplicationController
    before_action :set_product, :only => [:show, :edit, :update, :destroy]

    # GET /products
    def index
      @products = Product.all
    end

    # GET /products/1
    def show
    end

    # GET /products/new
    def new
      @product = Product.new
      @product.build_base_unit
    end

    # GET /products/1/edit
    def edit
    end

    # POST /products
    def create
      @product = Product.new(product_params)

      if @product.save
        redirect_to @product, :notice => 'Product was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /products/1
    def update
      if @product.update(product_params)
        redirect_to @product, :notice => 'Product was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /products/1
    def destroy
      @product.destroy
      redirect_to products_url, :notice => 'Product was successfully destroyed.'
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    def product_attributes
      [:code,
       :desc,
       :subtype,
       :category_code,
       :effective_date,
       :expiration_date,
       :comment,
       :base_unit_attributes => [:abbreviation, :desc]]
    end

    # Only allow a trusted parameter "white list" through.
    def product_params
      params.require(:product).permit(*product_attributes)
    end
  end
end
