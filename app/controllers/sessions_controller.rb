class SessionsController < ApplicationController
  def new
  end

  def create
  	@user = User.find_by(email: params[:user][:email])
  	if @user && @user.authenticate(params[:user][:password])
  		session[:user_id] = @user.id
  		redirect_to "/events"
  	else
  		flash[:errors] = ["invalid combination"]
  		redirect_to :back
  	end
  end

  def destroy
  	reset_session
  	redirect_to "/users/new"
  end
end
