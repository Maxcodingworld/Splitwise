class Bill < ActiveRecord::Base
  attr_accessible :amount, :c_id, :date, :description, :bill_type
  has_many :bill_friends, dependent: :destroy
  has_many :microposts ,dependent: :destroy
  has_many :histories ,dependent: :destroy
  belongs_to :user, :foreign_key => :c_id
  validates_presence_of :c_id, :date, :amount
  validates_numericality_of :amount
  
 
  EQUAL = false
  CUSTOM = true


 
   
  def self.populate_settle(requestedto,requestedamt,curr)
    s= Settle.new(:amount=>requestedamt, :payee => requestedto, :payer =>curr , :status => 0)
    s.save
  end
 
  def validateamount(friends_hash)
    sum = 0
    checkcustom = 0
    friends_hash.each do |x,y|
       amount=0 if amount.nil?
       y["amount"]=0 if (y["checked"] and y["amount"].nil?)
       y["Supposeamt"]=0 if bill_type ==CUSTOM and y["checked"] and y["Supposeamt"].nil?
       return 2 if amount <0
       return 2 if y["amount"].to_i <0 
       return 2 if bill_type == CUSTOM and y["Supposeamt"].to_i<0
       sum +=y["amount"].to_i if y["checked"]
       checkcustom += y["Supposeamt"].to_i if bill_type == CUSTOM and y["checked"]
     end

     if(sum == amount)
       if(bill_type==CUSTOM and checkcustom == amount)
        return 1
       elsif bill_type !=CUSTOM
        return 1
       end
    end
    return 0
    #errors.add(:Bill,"Splitted Amount should be equal to Total Amount")
  end




  def populate_bill_friends_and_split(friends_hash)
  	final_hash =  cleanup_hash(friends_hash)
  	s_amount = amount/(final_hash.count)
  	
    final_hash.each do |x,y|
   		s_amount = y["Supposeamt"].to_i if bill_type == CUSTOM 
  		self.histories << History.new(:user_id =>x,:amountpaid=>y["amount"], :supposetopay=>s_amount)
      y["amount"]=((y["amount"]).to_i - s_amount).to_s;
  	end

    final_hash.each do |f_id,diff|
        final_hash.each do |x,y|
          if(x!=f_id)
            if(diff["amount"].to_i>0 and y["amount"].to_i<0)
              if((diff["amount"].to_i + y["amount"].to_i) >=0)
                 self.microposts << Micropost.new(:amount => (y["amount"].to_i*-1),:payer_id =>x,:payee_id =>f_id)
                 diff["amount"]=(diff["amount"].to_i + y["amount"].to_i).to_s
                 y["amount"]=0.to_s
              else
                self.microposts << Micropost.new(:amount => (diff["amount"].to_i),:payer_id =>x,:payee_id =>f_id)
                diff["amount"]=0.to_s
                y["amount"]=(diff["amount"].to_i + y["amount"].to_i).to_s
              end  
            elsif (diff["amount"].to_i <0 and y["amount"].to_i >0)
              if((diff["amount"].to_i+y["amount"].to_i) >=0)
                 self.microposts << Micropost.new(:amount => (diff["amount"].to_i*-1),:payer_id =>f_id,:payee_id =>x)
                 diff["amount"]=0.to_s
                 y["amount"]=(diff["amount"].to_i+y["amount"].to_i).to_s
              else
                self.microposts << Micropost.new(:amount => (y["amount"].to_i),:payer_id =>f_id,:payee_id =>x)
                diff["amount"]=(diff["amount"].to_i+y["amount"].to_i).to_s
                y["amount"]=0.to_s
              end
            elsif diff["amount"].to_i == 0
                  break
            end
          end        
        end         
      end   

  end

  def cleanup_hash(friends_hash)
  	finalhash={}
  	friends_hash.each do |x,y|
      if(y["checked"]) 
        finalhash[x] = y
      end

   	end
   	finalhash
  end

end