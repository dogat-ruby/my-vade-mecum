class Book < ActiveRecord::Base
	mount_uploader :picture, PictureUploader
	ratyrate_rateable "bk_title"
end
