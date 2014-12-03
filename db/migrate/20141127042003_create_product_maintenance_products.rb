class CreateProductMaintenanceProducts < ActiveRecord::Migration
  def change
    create_table :product_maintenance_products do |t|
      t.string :code, :index => true
      t.string :desc
      t.string :subtype
      t.string :category_code
      t.date :effective_date
      t.date :expiration_date
      t.text :comment
      t.references :unit_of_measure, :base_unit, :index => true

      t.timestamps
    end
  end
end
