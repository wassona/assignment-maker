class Assignment < ApplicationRecord
	has_attached_file :image
	validates_attachment :image, content_type: { content_type: "application/pdf" }







end