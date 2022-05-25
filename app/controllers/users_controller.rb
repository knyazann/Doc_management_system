class UsersController < ApplicationController
  def index
  end

  def new
      @user = User.new
  end
    
  def create
      @user = User.new user_params
       if @user.save
         sign_in @user
         flash[:success] = "Пользователь #{@user.login} зарегистрирован!"
         redirect_to root_path
       else
         render :new
       end
  end

  def edit
  end

  def update
    if @document.update document_params
      flash[:success] = "Изменено!"
      redirect_to documents_path
    else
      render :edit
    end
  end

    def user_params
        params.require(:user).permit(:login, :password, :password_confirmation, :role)
    end
end
