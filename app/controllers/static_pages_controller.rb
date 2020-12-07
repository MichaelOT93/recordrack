class StaticPagesController < ApplicationController
    def home
        @record = current_user.records.build if logged_in?
        @genres = Genre.all
        @records = Record.all
           
        
    end

    def genre 
        genreName = params[:title]
        @records = Record.where("genre like ?", genreName)
        
    end
end
