class FavoritesController < ApplicationController
  def index
    @favorites = current_user.favorites.all
# ログインしているuseroお気に入り情報を取得
  end
  # createアクション（お気に入り登録）では、ビューからパラメータで送られてきたブログのid（params[:blog_id]）を使って、Favoriteのデータを作成・保存しています。
  def create
      favorite = current_user.favorites.create(picture_id: params[:picture_id])
      redirect_to pictures_path, notice: "#{favorite.picture.user.name}さんのブログをお気に入り登録しました"
    end
# destroyアクション（お気に入り解除）では、同じくビューからパラメータで送られてきたfavoriteのidで、Favoriteのデータを削除しています
# picture.user.name のpictureはアソシエーション名（メゾットとして使える）
  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to pictures_path, notice: "#{favorite.picture.user.name}さんのブログをお気に入り解除しました"

  end
end
