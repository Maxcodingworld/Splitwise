class AddColumnAmountToMicroposts < ActiveRecord::Migration
  def change
    add_column :microposts, :amount, :float
    add_column :microposts, :payer_id, :integer
    add_column :microposts, :payee_id, :integer
	remove_column :microposts, :date
	remove_column :microposts, :description
	remove_column :microposts, :s_money
	remove_column :microposts, :t_money
	remove_column :microposts, :user2
	remove_column :microposts, :user_id
  end
end

