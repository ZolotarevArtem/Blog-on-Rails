class UsersController < ApplicationController    
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
	  if @user.save
    	redirect_to '/'
  	else
    	render 'new'
  	end
  end

  def session_new
  	@user = User.new
  end

  def session_create
	  @user = User.find_by_name(params[:user][:name])
	  if @user && @user.auth(params[:user][:password])
	    session[:user] = @user
	    redirect_to "/"  
	  else
	    redirect_to "/login"
	  end
	end

	def destroy
		session[:user] = nil
		redirect_to "/"
	end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end