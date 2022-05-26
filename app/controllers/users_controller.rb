class UsersController < ApplicationController
  before_action :require_authentication, only: %i[edit update show]
  before_action :set_user!, only: %i[edit update]
  def index
    if user_signed_in?
      render :show
    end
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

  def show
    @department = Department.find_by id: @current_user.department_id
  end

  def edit
  end

  def update
    if @user.update user_profile_params
      flash[:success] = "Изменено!"
      redirect_to user_path(@current_user)
    else
      render :edit
    end
  end

    def user_params
        params.require(:user).permit(:login, :password, :password_confirmation, :role)
    end

    def set_user!
      @user = User.find params[:id]
    end

    def user_profile_params
      params.require(:user).permit(:surname, :name, :patronymic, :phone, :email, :post, :department_id)
    end

end
