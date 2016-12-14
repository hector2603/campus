class Course < ApplicationRecord
	belongs_to :user
	has_many :qualifications
	has_many :content_courses
	has_many :users, :through => :qualification
	accepts_nested_attributes_for :qualifications

	validates :name, :date_end, :active, :code, presence: true
	validates :name, length: { in: 1..75 , message: "debe tener entre 1 y 75 caracteres"}
	validates :code, length: { in: 1..15 , message: "debe tener entre 1 y 15 caracteres"}
end
