class ImagenNoticia < ActiveRecord::Migration[5.0]
  def change
  	add_attachment :reports, :avatar
  end
end
