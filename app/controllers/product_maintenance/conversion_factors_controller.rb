module ProductMaintenance
  class ConversionFactorsController < ProductMaintenance::ApplicationController
    before_action :set_unit_of_measure, :only => [:index, :new, :create, :edit, :update, :destroy]
    before_action :set_conversion_factor, :only => [:edit, :update, :destroy]

    def index
      @conversion_factors = @product.conversion_factors.order(:factor)
    end

    def new
      @conversion_factor = ConversionFactor.new(:unit_of_measure => @unit_of_measure)
    end

    def create
      @conversion_factor = ConversionFactor.new(conversion_factor_params)

      if @conversion_factor.save
        redirect_to product_conversion_factors_path(@product), :notice => 'Conversion Factor was successfully created.'
      else
        render :new
      end
    end

    def edit
    end

    def update
      if @conversion_factor.update(conversion_factor_params)
        redirect_to product_conversion_factors_path(@product), :notice => 'Conversion Factor was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @conversion_factor.destroy
      redirect_to product_conversion_factors_path(@product), :notice => 'Conversion Factor was successfully destroyed.'
    end

    private

    def set_conversion_factor
      @conversion_factor = ConversionFactor.find(params[:id])
    end

    def set_unit_of_measure
      @product = Product.find(params[:product_id])
      @unit_of_measure = @product.base_unit
    end

    def conversion_factor_params
      params.require(:conversion_factor).permit(:factor,
                                                :abbreviation,
                                                :desc,
                                                :unit_of_measure_id)
    end
  end
end
