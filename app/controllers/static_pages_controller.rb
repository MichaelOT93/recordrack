class StaticPagesController < ApplicationController
    def home
        @record = current_user.records.build if logged_in?
    end
end
