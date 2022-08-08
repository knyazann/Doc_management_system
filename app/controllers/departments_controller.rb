class DepartmentsController < ApplicationController
before_action :require_authentication

  
  def new 
    @department = Department.new
  end
  
  def create
    @department = Department.new department_params
  end

  def update
    @department.update department_params
  end

  private
    def department_params
      params.require(:department).permit(:dep_name, :dep_code)
    end
end