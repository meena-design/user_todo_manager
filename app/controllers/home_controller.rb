class HomeController < ApplicationController
  skip_before_action :ensure_user_logged_in
  def index
    #render plain: "I designed this home page . This is my home page"
    # now if you goto local host 300 it is show this page
    #@current_user_id = session[:current_user_id]
    if current_user
      redirect_to todos_path
    else
      render "index"
      #, locals: { user_name: current_user.first_name }
  end
end
end
