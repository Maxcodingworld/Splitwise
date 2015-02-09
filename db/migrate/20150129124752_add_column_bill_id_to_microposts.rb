class AddColumnBillIdToMicroposts < ActiveRecord::Migration
  def change
    add_column :microposts, :bill_id, :integer
  end
end
