class Micropost < ActiveRecord::Base
  attr_accessible :amount,:payer_id,:payee_id,:bill_id
  validates_presence_of :amount,:payer_id,:payee_id
  belongs_to :bill
  belongs_to :payer, :foreign_key => :payer_id, class_name: 'User'
  belongs_to :payee, :foreign_key => :payee_id, class_name: 'User'
end
