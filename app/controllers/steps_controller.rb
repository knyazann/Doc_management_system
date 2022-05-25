class StepsController < ApplicationController
  before_action :require_authentication
  before_action :set_route!
  before_action :set_step!, only: %i[show]

      def create
        @step = @route.steps.build step_params
        if @step.number == 1 
           @step.update(status: "в процессе")
        else 
          @step.update(status: "не начат")
        end
        if @step.save
          flash[:success] = "Этап добавлен"
          render 'routes/show'
        else
          flash[:warning] = "Ошибка!"
          redirect_to document_path(@route.document)
        end
      end

      def show
        @document = @route.document
      end
     

      private
      
      def step_params
        params.require(:step).permit(:number, :step_type, :user_id, :condition1, :condition2, :next_step1, :next_step2)
      end

      def set_route!
        @route = Route.find params[:route_id]
      end

      def set_step!
        @step = @route.steps.find params[:id]
      end
end