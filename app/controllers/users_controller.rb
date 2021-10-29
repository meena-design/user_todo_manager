class UsersController < ApplicationController
  #skip_before_action :verify_authenticity_token
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
      redirect_to "/"
  end
  #def login
   # email = params[:email]
    #password = params[:password]
    #user = User.where(email: email, password: password).exists?
    #render plain: user
  #end


end
