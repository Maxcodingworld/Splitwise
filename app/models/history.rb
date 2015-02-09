class History < ActiveRecord::Base
  attr_accessible :amountpaid, :bill_id, :supposetopay, :user_id

  belongs_to :bill
  belongs_to :user


end
