class CreateMicroposts < ActiveRecord::Migration
  def change
    create_table :microposts do |t|
      t.integer :user_id
      t.string :description
      t.integer :t_money
      t.integer :s_money
      t.integer :user2
      t.datetime :date

      t.timestamps
    end
  end
end
