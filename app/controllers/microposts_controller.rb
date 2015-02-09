class MicropostsController < ApplicationController
  before_filter :set_micropost, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @microposts =Micropost.where("payee_id= ? OR payer_id = ?",current_user.id,current_user.id)
    
    # @user=current_user
    # @microposts = @user.microposts 
    
  end

  def show
    respond_with(@micropost)
  end

  def new
    @users = User.all
    #.map{|u| [u.id, u.email]}
    @micropost = Micropost.new
    respond_with(@micropost)
  end

  def edit
  end

  def create
    @micropost = Micropost.new(params[:micropost])
    @micropost.save
    respond_with(@micropost)
  end

  def update
    @micropost.update_attributes(params[:micropost])
    respond_with(@micropost)
  end

  def destroy
    @micropost.destroy
    respond_with(@micropost)
  end

  private
    def set_micropost
      @micropost = Micropost.find(params[:id])
    end
end
