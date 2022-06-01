class HandbooksController < ApplicationController
    before_action :require_authentication

    def index
    end

    def departments_link
    render 'handbooks/departments' 
    end
end