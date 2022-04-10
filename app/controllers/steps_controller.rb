class StepsController < ApplicationController
  before_action :require_authentication
      
      def create
        @step = @route.steps.build step_params
        if @step.save
          redirect_to route_path(@route)
        else
          flash[:warning] = "Ошибка!"
          redirect_to documents_path
        end
      end
     
      private
      
      def step_params
        params.require(:step).permit(:type)
      end

      def set_document!
        @route = Route.find params[:route_id]
      end
end