class Blog < ApplicationRecord
  belongs_to :user
  has_many :comments

  	validates :title, :content, presence: true
	validates :title, length: { in: 1..75 , message: "debe tener entre 1 y 75 caracteres"}
	validates :content, length: { in: 1..10000 , message: "debe tener entre 1 y 10000 caracteres"}
end
