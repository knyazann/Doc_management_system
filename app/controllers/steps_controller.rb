class StepsController < ApplicationController
  before_action :require_authentication
  before_action :set_route!

      def create
        @step = @route.steps.build step_params
        if @step.save
          flash[:success] = "Этап добавлен"
          render 'routes/show'
        else
          flash[:warning] = "Ошибка!"
          redirect_to documents_path
        end
      end
     

      private
      
      def step_params
        params.require(:step).permit(:number, :step_type, :user_id, :condition1, :condition2, :next_step1, :next_step2)
      end

      def set_route!
        @route = Route.find params[:route_id]
      end
end