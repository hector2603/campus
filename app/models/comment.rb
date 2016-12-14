class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :blog

  	validates :content, presence: true
	validates :content, length: { in: 1..5000, message: "debe tener entre 1 y 5.000 caracteres"}
end
