class UsersController < ApplicationController
    before_action :require_logged_in, only:[:index, :show, :new]


    def index
        @users = User.all
        render :index
    end

    def show
        @user = User.find_by(id: params[:id])
        render :show
    end


    def user_params
        params.require(:user).permit(:username, :password_digest, :session_token)
    end

end

