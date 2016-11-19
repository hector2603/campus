class AddActiveReport < ActiveRecord::Migration[5.0]
  def change
  	add_column :reports, :active, :boolean, default: false
  end
end
