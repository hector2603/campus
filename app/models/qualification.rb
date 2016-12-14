class Qualification < ApplicationRecord
  belongs_to :course
  belongs_to :user


  	validates :nota, presence: true
	validates :nota, numericality: true
end
