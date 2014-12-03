class CreateProductMaintenanceConversionFactors < ActiveRecord::Migration
  def change
    create_table :product_maintenance_conversion_factors do |t|
      t.decimal :factor
      t.string :abbreviation
      t.string :desc
      t.references :unit_of_measure

      t.timestamps
    end

    add_index(:product_maintenance_conversion_factors, :unit_of_measure_id,
              :name => 'index_conversion_factors_on_unit_of_measure_id')
  end
end
