class UsersController < ApplicationController
  before_action :require_login, except: ['new']
  
  def new
    @user= User.new
  end

  def create
    @user = User.new(user_param)
    
    if @user.save
      redirect_to user_path(@user.id), success: 'ようこそ、monolistへ'
    else
      @user= User.new
      flash.now[:danger] = '登録に失敗しました、再度お試しください'
      render :new
    end
  end

  def edit
  end

  def show
    @user = User.find(params[:id])
    @items = @user.items.uniq
    @count_want = @user.want_items.count
    @count_have = @user.have_items.count
  end

  def update
  end

  def destroy
  end
  
  private
  def user_param
    params.require(:user).permit(:name, :email, :password)
  end
end
