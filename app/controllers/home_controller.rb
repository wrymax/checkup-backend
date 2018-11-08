class HomeController < ApplicationController
  def welcome
    render plain: 'Welcome to CheckUp!'
  end
end
