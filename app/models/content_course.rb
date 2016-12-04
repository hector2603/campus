class ContentCourse < ApplicationRecord
  belongs_to :course
  do_not_validate_attachment_file_type :file
  has_attached_file :file
  #validates_attachment_content_type :file, :content_type => ['image/jpeg', 'image/png', 'application/pdf']
end
