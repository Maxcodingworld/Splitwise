class BillsController < ApplicationController
  before_filter :set_bill, only: [:show, :edit, :update, :destroy]
  layout 'main_layout'
  respond_to :html

  def index
    @bills=Bill.all
    @userid = current_user.id 
    @allusersbutcurr = User.select("id,email").where("id!=#{current_user.id}")  
    @settledata = Settle.all 

  end

  def show
   @usershow=params["id"]
   @userview = User.find("#{@usershow}")
   @micropayer = Micropost.where("(payer_id = #{current_user.id} and payee_id = #{@usershow} ) or (payer_id = #{@usershow} and payee_id = #{current_user.id})").order("id desc")
   @settledata = Settle.all 
   @curr11 = current_user.id
 

  end

  def new
    @users = User.select("id,email")
    @bill = Bill.new
    respond_with(@bill)
  end

  def settle
    @curr = current_user.id
    @settlepayee = params["id"]
    
  end

  def bill_request
    @requestedto= params["id"]
    @requestedamt = params[:q]

    
    @curr =current_user.id
    Bill.populate_settle(@requestedto, @requestedamt,@curr)


  end  
 
  def edit
   @status = params["status_op"]
   @obj=Settle.find(params[:id])
    
   if @status == "PENDING" 
      @obj.status = 0 
      elsif @status == "ACCEPTED" 
      @obj.status =1 
      else 
      @obj.status =2 
   end
    @obj.save
  end



  def create
    @bill = Bill.new(params[:bill])
    @users = User.select("id,email")
    @valid=@bill.validateamount(params[:friends])
    if @valid == 0
      @msg = "Splitted Amount should be equal to total Amount"
      render action: :new
    elsif @valid ==2
      @msg = "Amount can't be Negative"
      render action: :new
    else
      if @bill.save
        @bill.populate_bill_friends_and_split(params[:friends])
        redirect_to(bills_path)
      else
        @users = User.select("id,email").where("id!=#{current_user.id}") 
        render action: :new
      end
    end
      #redirect_to microposts_path 
  end

  # def update
  #   @bill.update_attributes(params[:bill])
  #   respond_with(@bill)
  # end

  def destroy
    @bill.destroy
    respond_with(@bill)
  end

  private
    def set_bill
      @bill = Bill.all
    end
end
