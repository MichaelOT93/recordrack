class DashboardController < ApplicationController

    before_action :logged_in_user, only: [:show]
    before_action :correct_user, only: [:show]

    def show 
        @dashboard = User.find(params[:id])
        @order = Order.last
    end



    private 


    def logged_in_user
        unless logged_in?
            store_location
            flash[:danger] = "Please log in to do this."
            redirect_to login_url
        end
    end

    def correct_user 
        @user = User.find(params[:id])
        redirect_to(root_url) unless current_user?(@user)
    end
end
