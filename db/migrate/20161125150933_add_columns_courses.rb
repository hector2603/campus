class AddColumnsCourses < ActiveRecord::Migration[5.0]
  def change
  	add_column :courses, :description, :text
    add_column :courses, :code, :integer
    add_column :courses, :active, :boolean, default: false
  end
end
