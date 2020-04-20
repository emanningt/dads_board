class SessionsController < ApplicationController

    def new
        @user = User.new
        render :login
    end

    def create
        if auth_hash = request.env["omniauth.auth"]
         @user = User.find_or_create_by_omniauth(auth_hash)
         session[:user_id] = @user.id
         redirect_to user_path(@user)
        else 
            @user = User.find_by(username: params[:user][:username])
            if @user && @user.authenticate(params[:user][:password])
                session[:user_id] = @user.id
                redirect_to user_path(@user)
            else 
                flash[:error] = "Well your not very good at loging in. Lets try again..."
                redirect_to '/login'
            end
        end  
    end 

    def welcome
    end 

    def destroy
        session.delete(:user_id)
        redirect_to '/'
    end 

end


# oauth_nickname = request.env["omniauth.auth"]["info"]["nickname"]
# if @user = User.find_by(:username => oauth_nickname)
#     session[:user_id] = @user.id
#     redirect_to user_path(@user)
# else 
#     @user = User.create(:username => oauth_nickname, :password => SecureRandom.hex)
#     if @user.save
#         session[:user_id] = @user.id
#         redirect_to user_path(@user)
#     else 
#         raise @user.errors.full_messages.inspect
#     end 
# end 