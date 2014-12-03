class CreateProductMaintenancePrices < ActiveRecord::Migration
  def change
    create_table :product_maintenance_prices do |t|
      t.references :product, index: true
      t.decimal :amount
      t.date :effective_date

      t.timestamps
    end
  end
end
