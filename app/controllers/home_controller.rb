class HomeController < ApplicationController
  def index
    #render plain: "I designed this home page . This is my home page"
    # now if you goto local host 300 it is show this page
    render "index"
  end
end
