class Settle < ActiveRecord::Base
  attr_accessible :amount, :payee, :payer, :status
  validates_presence_of :payer, :payee, :amount ,:status
  validates_numericality_of :amount
  
end
