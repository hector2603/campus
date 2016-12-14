class Report < ApplicationRecord
	has_attached_file :avatar, styles: {peque: "50x50", media: "100x100", grande: "200x200", banner: "1200x315"}
	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

	validates :title, :active, :contenido, presence: true
	validates :title, length: { in: 1..75 , message: "debe tener entre 1 y 75 caracteres"}
	validates :contenido, length: { in: 1..10000 , message: "debe tener entre 1 y 10000 caracteres"}
end
