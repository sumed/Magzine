class SessionsController < ApplicationController

	def new

  end

  def create
     @user = User.where(email: params[:session][:email].downcase).first
       if @user && @user.authenticate(params[:session][:password])
       	      log_in @user
              redirect_to user_path(@user)
              
       else
       	flash[:danger] = 'Provide valid email and password'
  	     render 'new'
  end
  end
def destroy
    log_out
    redirect_to sessions_new_path
  end
end
