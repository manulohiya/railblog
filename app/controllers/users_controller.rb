class UsersController < ApplicationController
  
#form to create new user
  def new
  	if current_user
  		redirect_to profile_path
  	else	
  	@user = User.new
  	render :new
  	end
  end

#create new user in db
  def create
  	user = User.new(user_params)
  	if user.save
  		session[:user_id] = user.id
  		redirect_to profile_path

  	else
  		redirect_to signup_path
  end

end

#show current user
  def show
	@current_user = User.find(session[:user_id])
  	render :show
  end

  private 
  	def user_params
  		params.require(:user).permit(:first_name, :last_name, :email, :password)
  	end	


end

	

