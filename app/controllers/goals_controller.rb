class GoalsController < ApplicationController
before_action :require_authentication

    def index
        @goals = current_user.goals.all
    end

    def new 
        @goal = Goal.new
      end   
    
    def create
        @goal = Goal.create!(goal_params)
        redirect_to root_path
    end

    private
    def goal_params
      params.require(:goal).permit(:title)
    end
end
