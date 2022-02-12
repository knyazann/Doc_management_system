class GoalsController < ApplicationController
before_action :require_authentication
before_action :set_goal!, only: :destroy

    def index
      @goals = @current_user.goals.all
    end

    def new 
      @goal = Goal.new
    end   
    
    def create
      @goal = @current_user.goals.build goal_params
      if @goal.save
        flash[:success] = "Задание отправлено!"
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
    
    def goal_params
      params.require(:goal).permit(:title, :start_date, :end_date, :execution)
    end

    def set_goal!
      @goal = @current_user.goals.find params[:id]
    end
end
