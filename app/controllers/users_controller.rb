class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    #render plain: "Hello, this is /Users!"
    #render plain: Users.all
    render plain:Users.order(:id).map { |u| u.to_display_string }.join("\n")
  end
  def show
    id = params[:id]
    user = Users.find(id)
    render plain: user.to_display_string
  end
  def create
    user_name = params[:user_name]
    user_email = params[:user_email]
    user_password = params[:user_password]
    new_user =  Users.create!(user_name: user_name, user_email: user_email,user_password: user_password)
    response_text="Hey , Your new user is Created with the id #{new_user.id}"
    render plain:response_text
  end
  def login
    user_name = params[:user_name]
    user_password = params[:user_password]
    user = Users.where("user_name = ? and user_password = ?" ,user_name,user_password)
    user_status = user.empty? ? "false" :"true"
    render plain:"#{user_status}"
  end


end
