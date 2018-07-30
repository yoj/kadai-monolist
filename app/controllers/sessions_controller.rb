class SessionsController < ApplicationController
  before_action :require_login, except: ['new', 'create']
  
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: user_login_param[:email])
    
    if @user && @user.authenticate(user_login_param[:password])
      # ログイン成功 sessionにユーザIDを格納しログイン状態とする
      login(@user.id, 'ログインしました')
    else
      flash.now[:danger] = 'ログインできませんでした'
      render :new
    end
  end

  def destroy
    session['user_id'] = nil
    redirect_to login_path, success: 'ログアウトしました'
  end
  
  private
  def user_login_param
    params.require(:user).permit(:email, :password)
  end
end
