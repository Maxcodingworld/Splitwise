class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.integer :c_id
      t.datetime :date
      t.string :description
      t.integer :amount
      t.boolean :bill_type, :default => 0 

      t.timestamps
    end
  end
end
