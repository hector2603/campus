class Report < ApplicationRecord
	has_attached_file :avatar, styles: {peque: "50x50", media: "100x100", grande: "200x200", banner: "1200x315"}
	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
end
