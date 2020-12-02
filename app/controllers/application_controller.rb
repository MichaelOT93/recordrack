class ApplicationController < ActionController::Base

    protect_from_forgery with: :exception
    include CurrentCart
    before_action :set_cart

    include SessionsHelper
    include ApplicationHelper

    

    def logged_in_user
        unless logged_in?
            store_location
            flash[:danger] = "Please log in to do this."
            redirect_to login_url
        end
    end
    
end
