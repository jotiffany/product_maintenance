class CreateProductMaintenanceUnitOfMeasures < ActiveRecord::Migration
  def change
    create_table :product_maintenance_unit_of_measures do |t|
      t.string :abbreviation, :index => true
      t.string :desc
      t.references :product, :index => true
      t.boolean :base

      t.timestamps
    end
  end
end
