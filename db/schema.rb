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

ActiveRecord::Schema.define(:version => 20150205080422) do

  create_table "bill_friends", :force => true do |t|
    t.integer  "bill_id",      :precision => 38, :scale => 0
    t.integer  "user_id",      :precision => 38, :scale => 0
    t.integer  "contribution", :precision => 38, :scale => 0
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
  end

  create_table "bills", :force => true do |t|
    t.integer  "c_id",        :precision => 38, :scale => 0
    t.datetime "date"
    t.string   "description"
    t.integer  "amount",      :precision => 38, :scale => 0
    t.boolean  "bill_type",   :precision => 1,  :scale => 0, :default => false
    t.datetime "created_at",                                                    :null => false
    t.datetime "updated_at",                                                    :null => false
  end

  create_table "histories", :force => true do |t|
    t.integer  "user_id",      :precision => 38, :scale => 0
    t.integer  "bill_id",      :precision => 38, :scale => 0
    t.integer  "amountpaid",   :precision => 38, :scale => 0
    t.integer  "supposetopay", :precision => 38, :scale => 0
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
  end

  create_table "microposts", :force => true do |t|
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.decimal  "amount"
    t.integer  "payer_id",   :precision => 38, :scale => 0
    t.integer  "payee_id",   :precision => 38, :scale => 0
    t.integer  "bill_id",    :precision => 38, :scale => 0
  end

  create_table "settles", :force => true do |t|
    t.integer  "payer",      :precision => 38, :scale => 0
    t.integer  "payee",      :precision => 38, :scale => 0
    t.integer  "amount",     :precision => 38, :scale => 0
    t.integer  "status",     :precision => 38, :scale => 0
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                                 :default => "", :null => false
    t.string   "encrypted_password",                                    :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :precision => 38, :scale => 0, :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                                            :null => false
    t.datetime "updated_at",                                                            :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "i_users_reset_password_token", :unique => true

end
