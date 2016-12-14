class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,:recoverable, :rememberable, :trackable, :validatable

	has_attached_file :avatar, styles: {peque: "50x50", media: "100x100", grande: "200x200"}
	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
	#do_not_validate_attachment_file_type :avatar
	has_many :courses
	has_many :qualification
	has_many :blogs
	has_many :comments
	has_many :courses, :through => :qualification

	validates :name, :rol, :email, presence: true
	validates :name, length: { in: 1..75 , message: "debe tener entre 1 y 75 caracteres"}
end
