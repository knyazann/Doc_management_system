class ContractorsController < ApplicationController
#before_action :require_authentication
#before_action :set_document!, only: %i[edit update show destroy]

  
  def new 
    @contractor = Contractor.new
  end
  
  def create
    @contractor = Contractor.new contractor_params
  end

  private
    def contractor_params
      params.require(:contractor).permit(:contr_name)
    end
end