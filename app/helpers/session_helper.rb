module SessionHelper
  def logged_in?
    # sessionにIDが入っているか
    # DBにユーザがいるか
    #current_user ||= User.find_by(id: session[:user_id])
    if current_user
      return true
    else
      return false
    end
  end
  
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
end
