class Book < ActiveRecord::Base
	mount_uploader :picture, PictureUploader
	ratyrate_rateable "title"

	belongs_to :owner , class_name: "User",foreign_key: "user_id"
	has_many :reviews

	#accepts_nested_attributes_for :reviews
end
