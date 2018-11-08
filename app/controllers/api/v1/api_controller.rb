# app/controllers/api/v1/api_controller.rb

module Api::V1
  class ApiController < ApplicationController
    # before_action :authenticate_user!

    # def current_user
    #   unless @current_user
    #     auth_token = request.headers["Authorization"]
    #     if user = User.find_by_auth_token(auth_token)
    #       @current_user = user
    #       session[:user_id] = @current_user.id
    #     else
    #       return nil
    #     end
    #   end

    #   @current_user
    # end

    # def current_profile
    #   @current_user && @current_user.profile
    # end

    # private

    # # Authenticate current_user by headers["Authorization"]
    # def authenticate_user!
    #   unless current_user
    #     render_error(10003, 401) and return
    #   end
    # end
  end
end
