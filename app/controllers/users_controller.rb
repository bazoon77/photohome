class UsersController < ApplicationController
  before_filter :authenticate_user!

  

  def index
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
  
  def update
    authorize! :update, @user, :message => 'Not authorized as an administrator.'
    @user = User.find(params[:id])
      
    @user.role_ids = params[:user]["role_ids"]

    # if @user.update_attributes(params[:user], :as => :admin)
    # if @user.update_attributes(params[:user])
    if @user.save
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end
    
  def destroy
    authorize! :destroy, @user, :message => 'Not authorized as an administrator.'
    user = User.find(params[:id])
    unless user == current_user
      user.destroy
      redirect_to users_path, :notice => "User deleted."
    else
      redirect_to users_path, :notice => "Can't delete yourself."
    end
  end


  def user_params
    params.require(:user).permit(:username, :email, :password, :salt, :encrypted_password)
  end
end