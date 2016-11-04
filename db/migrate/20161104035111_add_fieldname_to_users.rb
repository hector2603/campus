class AddFieldnameToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :name, :string
    add_column :users, :rol, :integer
  end
end
