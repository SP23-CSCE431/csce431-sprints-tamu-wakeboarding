class UsersController < ApplicationController
  before_action :set_user, only: %i[ show destroy]

  def search
    @products = Admin.where('is_approved = true AND first_name LIKE ? AND last_name LIKE ?', "%#{params[:first_name]}%", "%#{params[:last_name]}%")
    render(json: @products)
  end

  # GET /users or /users.json
  def index
    # need to check the role of the user
    @user = current_admin
    if @user.has_role?("Admin")
      # check if user passed filter arguments when looking at user
      @users = if params[:first_name].present? || params[:last_name].present?
        Admin.where('is_approved = true AND first_name LIKE ? AND last_name LIKE ?', "%#{params[:first_name]}%", "%#{params[:last_name]}%")
               else
        Admin.where(is_approved: true) 
               end
    else
      # redirect to account if they do not have permission
      respond_to do |format|
        format.html { redirect_to(accounts_url, notice: "You do not have access to this page. Contact your adminstrator for help.") }
      end
    end
  end

  def approval
    # need to check the role of the user
    @user = current_admin
    if @user.has_role?("Admin")
      # check if user passed filter arguments when looking at user
      @users = if params[:first_name].present? || params[:last_name].present?
        Admin.where('is_approved = false AND first_name LIKE ? AND last_name LIKE ?', "%#{params[:first_name]}%", "%#{params[:last_name]}%")
               else
        Admin.where(is_approved: false) 
               end
    else
      # redirect to account if they do not have permission
      respond_to do |format|
        format.html { redirect_to(accounts_url, notice: "You do not have access to this page. Contact your adminstrator for help.") }
      end
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = Admin.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def delete
      @users = Admin.find(params[:id])
    end
end
