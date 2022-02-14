class GoalsController < ApplicationController
before_action :require_authentication
before_action :set_goal!, only: %i[edit update show destroy]

    def index
      @goals = @current_user.goals.all
    end

    def show
      @task = @goal.tasks.build
      @tasks = Task.where goal_id: @goal.id
      @users = User.all
    end

    def new 
      @goal = Goal.new
    end   
    
    def create
      @goal = @current_user.goals.build goal_params
      if @goal.save
        redirect_to goal_path(@goal)
      else
        flash[:warning] = "Задание НЕ сохранено!"
        redirect_to goals_path
      end
    end

    def edit
    end

    def update
      if @goal.update goal_params
        flash[:success] = "Задание изменено!"
        redirect_to goals_path
      else
        render :edit
      end
    end

    def destroy
      @goal.destroy
      flash[:success] = "Задание удалено!"
      redirect_to goals_path
    end

   

    private
    
    def goal_params
      params.require(:goal).permit(:title, :start_date, :end_date, :execution)
    end

    def set_goal!
      @goal = @current_user.goals.find params[:id]
    end
end
