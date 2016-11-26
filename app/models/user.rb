class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,:recoverable, :rememberable, :trackable, :validatable

	has_attached_file :avatar, styles: {peque: "50x50", media: "100x100", grande: "200x200"}
	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
	#do_not_validate_attachment_file_type :avatar
	has_many :courses
	has_many :qualification
	has_many :courses, :through => :qualification
end
