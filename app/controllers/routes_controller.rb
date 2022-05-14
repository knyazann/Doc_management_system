class RoutesController < ApplicationController
  before_action :require_authentication
  before_action :set_document!
  before_action :set_route!, only: %i[show destroy]

      def create
        @route = @document.routes.build route_params
        @route.user_id = @current_user.id
        if @route.save
          flash[:success] = "Маршрут задан"
          redirect_to document_path(@document)
        else
          flash[:warning] = "Ошибка!"
          render 'documents/show'
        end
      end

      def show
        @step = @route.steps.build
        @steps = Step.where route_id: @route.id
        @users = User.all
      end

      def destroy
        @route.destroy
        flash[:success] = "Маршрут удалён!"
        redirect_to document_path(@document)
      end

     
      private
      
      def route_params
        params.require(:route).permit(:route_name, :status, :user_id)
      end

      def set_document!
        @document = Document.find params[:document_id]
      end

      def set_route!
        @route = @document.routes.find params[:id]
      end
end