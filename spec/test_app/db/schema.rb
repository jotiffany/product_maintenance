# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(:version => 20_141_202_002_644) do

  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'product_maintenance_conversion_factors', :force => true do |t|
    t.decimal 'factor'
    t.string 'abbreviation'
    t.string 'desc'
    t.integer 'unit_of_measure_id'
    t.datetime 'created_at'
    t.datetime 'updated_at'
  end

  add_index 'product_maintenance_conversion_factors', ['unit_of_measure_id'], :name => 'index_conversion_factors_on_unit_of_measure_id', :using => :btree

  create_table 'product_maintenance_prices', :force => true do |t|
    t.integer 'product_id'
    t.decimal 'amount'
    t.date 'effective_date'
    t.datetime 'created_at'
    t.datetime 'updated_at'
  end

  add_index 'product_maintenance_prices', ['product_id'], :name => 'index_product_maintenance_prices_on_product_id', :using => :btree

  create_table 'product_maintenance_products', :force => true do |t|
    t.string 'code'
    t.string 'desc'
    t.string 'subtype'
    t.string 'category_code'
    t.date 'effective_date'
    t.date 'expiration_date'
    t.text 'comment'
    t.integer 'unit_of_measure_id'
    t.integer 'base_unit_id'
    t.datetime 'created_at'
    t.datetime 'updated_at'
  end

  add_index 'product_maintenance_products', ['base_unit_id'], :name => 'index_product_maintenance_products_on_base_unit_id', :using => :btree
  add_index 'product_maintenance_products', ['unit_of_measure_id'], :name => 'index_product_maintenance_products_on_unit_of_measure_id', :using => :btree

  create_table 'product_maintenance_unit_of_measures', :force => true do |t|
    t.string 'abbreviation'
    t.string 'desc'
    t.integer 'product_id'
    t.boolean 'base'
    t.datetime 'created_at'
    t.datetime 'updated_at'
  end

  add_index 'product_maintenance_unit_of_measures', ['product_id'], :name => 'index_product_maintenance_unit_of_measures_on_product_id', :using => :btree

end
