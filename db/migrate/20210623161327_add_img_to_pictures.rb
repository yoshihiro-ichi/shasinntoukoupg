class AddImgToPictures < ActiveRecord::Migration[5.2]
  def change
    add_column :pictures, :img, :text
  end
end
