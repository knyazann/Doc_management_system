class DepartmentsController < ApplicationController
#before_action :require_authentication
#before_action :set_document!, only: %i[edit update show destroy]

  
  def new 
    @department = Department.new
  end
  
  def create
    @department = Department.new department_params
  end

  private
    def department_params
      params.require(:department).permit(:dep_name)
    end
end