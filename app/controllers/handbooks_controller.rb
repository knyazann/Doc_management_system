class HandbooksController < ApplicationController
    before_action :require_authentication

    def index
    end

    def staff_link
        @staff = User.where(role:1)
        @departments = Department.all
        render 'handbooks/staff'
    end

    def departments_link
        render 'handbooks/departments' 
    end
end