class CreateComments < ActiveRecord::Migration[5.0]
  def change
  	 User.create(name: 'admin', email: 'admin@gmail.com', rol: '1', password: '123456', active: true)
    create_table :comments do |t|
      t.references :user, foreign_key: true
      t.references :blog, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
