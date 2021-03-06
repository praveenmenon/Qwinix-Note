class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		  @user = User.new(user_params)
  if @user.save
    redirect_to root_url, :notice => "Signed up!"
  else
    render "new"
  end
	end

	def index
	end
 private

 def user_params
 	 params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :password_confirmation, :phone_number, :city, :state, :country)
 end

end
