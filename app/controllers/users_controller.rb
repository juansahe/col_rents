class UsersController < ApplicationController
  def new
  	@user = User.new
  	respond_to do |format|
      format.html { render('shared/signmodal') }
    end
  end
  
  def show
    @user = User.find(params[:id])
  end
  
end
