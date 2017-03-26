class UsersController < ApplicationController
  def new
  end

  def create
    user_details = {
      :first_name => params[:first_name],
      :last_name => params[:last_name],
      :email => params[:email],
      :password => params[:password]
    }
    new_user = User.new(user_details)
    if new_user.save
      session[:user_id] = new_user.id
      redirect_to '/'
    else
      redirect_to 'users/new'
    end
  end
end