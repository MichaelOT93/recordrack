class UserController < ApplicationController


    def login 
        session[:login] = 1
        flash[:notice] = "You have successfully Logged In"
        redirect_to root_url
    end

    def logout
        session[:login] = nil
        flash[:notice] = "Until we meet again!"
        redirect_to root_url
    end
end
