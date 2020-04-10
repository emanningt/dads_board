class UsersController < ApplicationController
    
    def new
        @user = User.new(params[:id])
    end

    def create
    end 


end
