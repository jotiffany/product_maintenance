module ProductMaintenance
  class PricesController < ProductMaintenance::ApplicationController
    before_action :set_product, :only => [:new, :create, :edit, :update, :destroy]
    before_action :set_price, :only => [:edit, :update, :destroy]

    def new
      @price = Price.new(:product => @product)
    end

    def create
      @price = Price.new(price_params)

      if @price.save
        redirect_to product_path(@product), :notice => 'Price was successfully created.'
      else
        render :new
      end
    end

    def edit
    end

    def update
      if @price.update(price_params)
        redirect_to product_path(@product), :notice => 'Price was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @price.destroy
      redirect_to product_path(@product), :notice => 'Price was successfully destroyed.'
    end

    private

    def set_price
      @price = Price.find(params[:id])
    end

    def set_product
      @product = Product.find(params[:product_id])
    end

    def price_params
      params.require(:price).permit(:amount,
                                    :effective_date,
                                    :product_id)
    end
  end
end
