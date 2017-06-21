class UsersController < ApplicationController

  before_action :require_login, only: [:show,:edit]
	before_action :require_correct_user, only: [:show, :edit]

  def new
  end

  def show
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params) 
  		redirect_to "/events"
  	else
  		flash[:errors] = @user.errors.full_messages
  		redirect_to :back
  	end
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		session[:user_id] = @user.id
  		redirect_to "/events"
  	else
  		flash[:errors] = @user.errors.full_messages
  		redirect_to :back
  	end
  end

  def destroy

  end
  private
  	def user_params
  		params.require(:user).permit(:first_name, :last_name, :email, :location, :state, :password, :password_confirmation)
  	end
end
