class Book < ActiveRecord::Base
	# Associations
	belongs_to :owner , class_name: "User",foreign_key: "user_id"
	has_many :reviews
	#scopes
	default_scope where(is_deleted: false)
	scope :active, -> { where(is_active:true)  }
	scope :deactivated, -> { where(is_active:false,is_approved: true)  }
	scope :to_be_approved, -> { where(is_approved: false)  }
	scope :approved, -> { where(is_approved: true)  }
	mount_uploader :picture, PictureUploader
	ratyrate_rateable "title"
	def approve
		self.is_approved=true
		self.is_active=true
		self.save
	end
	def approve!
		self.is_approved=true
		self.is_active=true
		self.save!
	end
	def deactivate
		self.is_active=false
		self.save
	end
	def activate
		self.is_active=true
		self.save
	end
	#accepts_nested_attributes_for :reviews
end
