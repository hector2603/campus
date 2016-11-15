class AddFielActiveUser < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :active, :boolean, default: false
  	User.create name: 'admin', email: 'admin@gmail.com', rol: '1', password: '123456', active: true
  end

end
