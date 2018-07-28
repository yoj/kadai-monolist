class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  include SessionHelper
  
  # Add flashType for bootstrap
  add_flash_types :success, :info, :warning, :danger
  
  private
  def require_login
    unless logged_in?
      redirect_to login_path, danger: "ログインしていません"
    else
    end
  end
end
