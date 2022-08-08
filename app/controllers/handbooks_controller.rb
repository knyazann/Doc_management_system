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
        @departments = Department.all
        @users = User.all
        render 'handbooks/departments' 
    end
end