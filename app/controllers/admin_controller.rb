class AdminController < ApplicationController
  layout 'admin'

  before_action :authenticate_user! 
  before_action :require_admin!

  private

    def require_admin!
      unless current_user.admin?
        sign_out current_user
        redirect_to admin_root_path
        return false
      end
    end

end
