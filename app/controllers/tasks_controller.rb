class TasksController < ApplicationController
  before_action :require_authentication
  before_action :set_goal!
  before_action :set_task!, only: :destroy
      
      def create
        @task = @goal.tasks.build task_params
        if @task.save
          flash[:success] = "Сохранено"
          UserMailer.with(task: @task).new_task_email.deliver_later
          redirect_to goal_path(@goal)
        else
          flash[:warning] = "Задание НЕ отправлено!"
          render 'goals/show'
        end
      end

      def show
        @task = @current_user.tasks.find params[:id]
      end

      def destroy
        @task.destroy
        flash[:success] = "Задание удалено!"
        redirect_to goals_path
      end
     
      private
      
      def task_params
        params.require(:task).permit(:user_id, :description)
      end

      def set_goal!
        @goal = Goal.find params[:goal_id]
      end

      def set_task!
        @task = @goal.tasks.find params[:id]
      end
end