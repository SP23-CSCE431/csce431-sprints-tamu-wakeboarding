class ApplicationController < ActionController::Base
    # include ApplicationHelper
    before_action :authenticate_admin!
    before_action :check_user_approval
    
    include ApplicationHelper

    private
    
    # need to validate the user can access the page
    def check_user_approval
        logger.info(params)
        if current_admin && !current_admin.is_approved?
            # they will be able to access the account page and sign out path if the account is not approved
            if !(params[:controller] == "account" && params[:action] == "index") && !(params[:controller] == "admins/sessions" && params[:action] == "destroy")
                flash[:alert] = "Your account is not approved yet. Please wait for approval or contact your Administrators."
                redirect_to accounts_path
            end
        end 
    end

    
end
