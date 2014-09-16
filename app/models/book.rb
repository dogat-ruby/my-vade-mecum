class Book < ActiveRecord::Base
	mount_uploader :picture, PictureUploader
	ratyrate_rateable "bk_title"

	belongs_to :user
	has_many :reviews

	#accepts_nested_attributes_for :reviews
end
