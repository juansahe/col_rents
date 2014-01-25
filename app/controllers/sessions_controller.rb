class SessionsController < ApplicationController

	def new
	end

	def create
		user = User.find_by(email: params[:session][:login_email].downcase)
		if user && user.authenticate(params[:session][:login_password])
			sign_in user
			redirect_back_or user
		else
			flash.now[:danger] = t('views.users.bad_credentials')
			render 'new'
		end
	end

	def destroy
    sign_out
    redirect_to root_url
	end
end
