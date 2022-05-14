class StepsController < ApplicationController
  before_action :require_authentication
  before_action :set_step!

      def create
       @decision = params[:decision]
          redirect_to documents_path
      
      end
    

      private
      
      def participant_params
        params.require(:participant).permit(:user_id, :decision)

      def set_step!
        @step = Step.find params[:step_id]
      end
end