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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130411143002) do

  create_table "billing_addresses", :force => true do |t|
    t.integer  "user_id"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "carts", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "customers", :force => true do |t|
    t.string   "full_name"
    t.string   "email"
    t.string   "display_name"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "line_items", :force => true do |t|
    t.integer  "product_id"
    t.integer  "cart_id"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.integer  "quantity",   :default => 1
    t.integer  "order_id"
  end

  add_index "line_items", ["cart_id"], :name => "index_line_items_on_cart_id"
  add_index "line_items", ["product_id"], :name => "index_line_items_on_product_id"

  create_table "order_events", :force => true do |t|
    t.string   "status"
    t.integer  "order_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "order_events", ["order_id"], :name => "index_order_events_on_order_id"

  create_table "orders", :force => true do |t|
    t.integer  "total_price", :null => false
    t.integer  "user_id",     :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "phone_numbers", :force => true do |t|
    t.string   "phone"
    t.boolean  "receive_sms"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "product_categories", :force => true do |t|
    t.integer  "product_id"
    t.integer  "category_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "product_categories", ["category_id"], :name => "index_product_categories_on_category_id"
  add_index "product_categories", ["product_id"], :name => "index_product_categories_on_product_id"

  create_table "products", :force => true do |t|
    t.string   "title",                                :null => false
    t.text     "description",                          :null => false
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
    t.boolean  "active",             :default => true
    t.integer  "price",                                :null => false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "slug"
    t.integer  "store_id"
  end

  add_index "products", ["slug"], :name => "index_products_on_slug"
  add_index "products", ["store_id"], :name => "index_products_on_store_id"

  create_table "shipping_addresses", :force => true do |t|
    t.integer  "user_id"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "stores", :force => true do |t|
    t.string "name"
    t.string "path"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                              :null => false
    t.string   "display_name"
    t.boolean  "admin",           :default => false, :null => false
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "password_digest",                    :null => false
    t.string   "full_name",                          :null => false
    t.integer  "store_id"
  end

  add_index "users", ["store_id"], :name => "index_users_on_store_id"

end
