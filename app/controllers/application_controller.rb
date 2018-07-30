class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  include SessionHelper
  
  # Add flashType for bootstrap
  add_flash_types :success, :info, :warning, :danger
  
  private
  
  def login(user_id, msg)
    session['user_id'] = user_id
    redirect_to user_path(user_id), success: msg
  end
  
  def require_login
    unless logged_in?
      redirect_to login_path, danger: "ログインしていません"
    else
    end
  end
  
  def read(result)
    code = result['itemCode']
    name = result['itemName']
    url = result['itemUrl']
    image_url = result['mediumImageUrls'].first['imageUrl'].gsub('?_ex=128x128', '')

    {
      code: code,
      name: name,
      url: url,
      image_url: image_url,
    }
  end
end
