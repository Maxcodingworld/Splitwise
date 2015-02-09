class BillFriend < ActiveRecord::Base
  attr_accessible :bill_id, :contribution, :user_id
  belongs_to :bill
  belongs_to :user

  def get_value
      obj=Bill.new
      Bill::CUSTOM
  end
end
