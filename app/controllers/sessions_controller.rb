class SessionsController < ApplicationController
	def new
	end

	def create
	  user = User.find_by_email(params[:login][:email])
	  if user && user.authenticate(params[:login][:password])
	    session[:user_id] = user.id
	    redirect_to root_url, notice: "You are now logged in."
	  else
	    flash.now.alert = "Email or password is not valid."
	    render "new"
	  end
	end

	def destroy
		cookies.delete(:auth_token)
	  session[:user_id] = nil
	  redirect_to root_url, notice: "You are now logged out."
	end

end
