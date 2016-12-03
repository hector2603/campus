class CreateContentCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :content_courses do |t|
      t.references :course, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
