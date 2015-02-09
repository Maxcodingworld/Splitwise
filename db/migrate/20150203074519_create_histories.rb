class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.integer :user_id
      t.integer :bill_id
      t.integer :amountpaid
      t.integer :supposetopay

      t.timestamps
    end
  end
end
