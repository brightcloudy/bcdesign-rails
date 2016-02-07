class AdminController < ApplicationController
  before_action :authenticate_admin!, only: [:addqr]

  def new
  end 

  def token
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
