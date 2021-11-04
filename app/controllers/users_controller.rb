class UsersController < ApplicationController
  #skip_before_action :verify_authenticity_token
  skip_before_action :ensure_user_logged_in
  def new
    render "users/new"
  end
  def create
    new_user = User.create!(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password]
    )
      #password_digest: digest(params[:password])
      #session[:current_user_id] = user.id
      redirect_to "/"
  end
  #def login
   # email = params[:email]
    #password = params[:password]
    #user = User.where(email: email, password: password).exists?
    #render plain: user
  #end


end
