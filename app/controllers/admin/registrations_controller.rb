class Admin::RegistrationsController < ApplicationController
  before_filter :require_admin_user

  def index
    @registrations = Registration.all
  end

  def delete
    if registration = Registration.find_by_id(params[:id])
      flash[:notice] = "Successfully deleted registration"
    else
      flash[:error] = "Could not find registration with id #{params[:id]}"
    end
    redirect_to :action => :index
  end

  private
  def require_admin_user
    if current_user.admin?
      return true
    end
    flash[:error] = "Access Denied"
    redirect_to root_url
    false
  end

end
