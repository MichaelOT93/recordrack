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
            log_in @user
            redirect_to @user
            flash[:success] = 'Welcome on Board!'
            
        else
            render 'new'
        end
    end



    private 

        def user_params
            params.require(:user)
            .permit(:username, :email, :password, :password_confirmation)
        end
    end
