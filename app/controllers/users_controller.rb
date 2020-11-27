class UsersController < ApplicationController

    def index
        @user = User.all 
    end

    def new 
        @user = User.new
    end

    def show 
        @user = User.find(params[:id])
    end

    def create 
        @user = User.new(user_params)
        
           
        if @user.save
            redirect_to @user
            flash[:success] = 'Welcome on Board!'
            
        else
            render 'new'
        end
    end


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

    private 

        def user_params
            params.require(:user)
            .permit(:username, :email, :password, :password_confirmation)
        end
    end
