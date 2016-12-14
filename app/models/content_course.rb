class ContentCourse < ApplicationRecord
  belongs_to :course
  do_not_validate_attachment_file_type :file
  has_attached_file :file
  #validates_attachment_content_type :file, :content_type => ['image/jpeg', 'image/png', 'application/pdf']

  	validates :content, presence: true
	validates :content, length: { in: 1..5000 , message: "debe tener entre 1 y 5000 caracteres"}
end
