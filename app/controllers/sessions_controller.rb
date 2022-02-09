class SessionsController < ApplicationController
before_action :require_authentication, only: :destroy

    def new
    end
    
    def create
     user = User.find_by login: params[:login]
     if user&.authenticate(params[:password]) # метод authenticate добавился благодаря has_secure_password
        sign_in user
        flash[:success] = "И снова здравствуйте, #{user.login}!"
        redirect_to root_path
     else 
        flash[:warning] = "Неверный логин и/или пароль :("
        redirect_to new_session_path
     end
    end

    def destroy
      sign_out
      flash[:success] = "До свидания!"
      redirect_to root_path
    end
end
