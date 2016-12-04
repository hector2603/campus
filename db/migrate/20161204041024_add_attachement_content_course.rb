class AddAttachementContentCourse < ActiveRecord::Migration[5.0]
  def change
  	add_attachment  :content_courses, :file
  end
end
