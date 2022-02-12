class TasksController < ApplicationController
before_action :require_authentication
before_action :current_goal
before_action :set_goal!, only: :destroy

    def new 
      @task = @current_goal.tasks.new
    end   
    
    def create
      @task = @current_goal.tasks.build task_params
      if @task.save
        flash[:success] = "Сохранено"
        redirect_to goals_path
      else
        flash[:warning] = "Задание НЕ отправлено!"
        redirect_to goals_path
      end
    end

    def destroy
      @goal.destroy
      flash[:success] = "Задание удалено!"
      redirect_to goals_path
    end

   

    private
    
    def task_params
      params.require(:task).permit(:number, :description, :end_date, :completation_date)
    end

    def current_goal
      @current_goal = Goal.find_by id: params[:id]
    end

    def set_task!
      @task = Goal.find_by id: params[:id].tasks.find params[:id]
    end
end
