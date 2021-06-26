class PicturesController < ApplicationController
  before_action :set_picture, only: [ :show ,:edit, :update, :destroy]
  before_action :login_check, only:[:edit,:destroy]
  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params)
    @picture.user_id = current_user.id
      if params[:back]
      render :new
    else
      if @picture.save
        redirect_to pictures_path,notice:"投稿しました"
        ContactMailer.contact_mail(@picture).deliver
      else
        render :new
      end
    end
  end

  def show
    @favorite = current_user.favorites.find_by(picture_id: @picture.id)
  end

  def edit
  end

  def update
    if @picture.update(picture_params)
      redirect_to picture_path
    else
      render :edit
    end
  end

  def confirm
    @picture = Picture.new(picture_params)
    @picture.user_id = current_user.id
     render :new if @picture.invalid?
  end

  def destroy
     @picture.destroy
      redirect_to pictures_path
  end

  private

  def set_picture
      @picture = Picture.find(params[:id])
  end

  def login_check
    unless Picture.find(params[:id]).user_id == current_user.id
      flash[:alert]="ログインしてください"
      redirect_to new_session_path
    end
  end

  def picture_params
      params.require(:picture).permit(:title, :content, :img, :img_cache)
  end
end
