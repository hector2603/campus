class Course < ApplicationRecord
	belongs_to :user
	has_many :qualifications
	has_many :content_courses
	has_many :users, :through => :qualification
	accepts_nested_attributes_for :qualifications
end
