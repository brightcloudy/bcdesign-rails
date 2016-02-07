class AdminController < ApplicationController
  before_action :authenticate_admin!, only: [:addqr, :new, :index]

  def new
  end 

  def token
  end

  def destroy
    @admin = Admin.find(params[:id])
    if !(current_admin.superadmin)
      flash[:error] = "You are not authorized to perform this action!"
      redirect_to '/'
    end

    @admin.destroy

    flash[:success] = "Account destroyed successfully."

    redirect_to '/admin'
  end

  def approve
    @admin = Admin.find(params[:id])
    if !(current_admin.superadmin)
      flash[:error] = "You are not authorized to perform this action!"
      redirect_to '/'
    end
    if @admin.update(approved: true)
      flash[:success] = "Account #{@admin.email} approved successfully."
      redirect_to '/admin'
    else
      flash[:error] = "Failed to approve account!"
      redirect_to '/admin'
    end
  end

  def index
    @admins = Admin.all
    if !(current_admin.superadmin)
      flash[:error] = "You are not authorized to access this page."
      redirect_to '/'
    end
  end

  def addqr
    @admin = current_admin
    totp = ROTP::TOTP.new(params['auth_secret'])
    if totp.verify(params['otp'])
      if @admin.update(auth_secret: params['auth_secret'])
        flash[:success] = "Two-factor authentication added sucessfully!"
        redirect_to '/'
      else
        flash[:alert] = "Failed to add two-factor authentication!"
        redirect_to '/google_authenticate/new'
      end
    else
      flash[:alert] = "Invalid two-factor authentication code."
      redirect_to controller: 'google_authenticate', action: 'new', auth_secret: params['auth_secret']
    end
  end
end
