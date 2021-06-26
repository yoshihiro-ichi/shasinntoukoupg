class UsersController < ApplicationController
  skip_before_action :login_required, only: [:new, :create,]
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :ensure_correct_user,only:[:show]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end

  def show

  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path, notice: "プロフィールを更新しました！"
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password,
      :password_confirmation, :img,:img_cache)
    end
    def set_user
      @user = User.find(params[:id])
    end

    def ensure_correct_user
      if current_user.id !=  params[:id].to_i
        redirect_to  new_session_path
      end
    end
  end
