class CreateBillFriends < ActiveRecord::Migration
  def change
    create_table :bill_friends do |t|
      t.integer :bill_id
      t.integer :user_id
      t.integer :contribution

      t.timestamps
    end
  end
end
