class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
  has_many :microposts
  has_many :bills
  
  has_many :histories
  has_many :payer, :foreign_key => :payer_id, class_name: 'Micropost'
  has_many :payee, :foreign_key => :payee_id, class_name: 'Micropost'
  
end
