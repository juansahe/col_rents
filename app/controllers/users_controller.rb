class UsersController < ApplicationController
  before_action :signed_in_user,  only: [:edit, :update, :show]
  before_action :correct_user,    only: [:edit, :update, :show]

  def new
  	@user = User.new
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def create
  	@user = User.new(user_params)
  		if @user.save
        sign_in @user
  			flash[:success] = t('views.users.welcome')
        respond_to do |format|
          format.html { redirect_to @user }
          format.js { render js: "window.location = '#{user_path(@user)}'" }
        end 
      else
        render 'new'
  		end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = t('views.users.updated')
      redirect_to @user
    else
      render 'edit'
    end
  end

  private
  	def user_params
  		params.require(:user).permit(:name, :email, :password, :password_confirmation)
  	end

    #Before filters
    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, alert: t('views.users.no_permit')
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to root_url, alert: t('views.users.no_correct') unless current_user?(@user) 
    end
end
