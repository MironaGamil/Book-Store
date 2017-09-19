class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def logged_in_admin
      unless logged_in?
      	flash[:danger]="log in as admin first!"
        redirect_to login_url
      end
    end
end
