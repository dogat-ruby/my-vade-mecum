class Book < ActiveRecord::Base
	# Associations
	belongs_to :owner , class_name: "User",foreign_key: "user_id"
	has_many :reviews
	# has_many
	#scopes
	default_scope -> { where(is_deleted: false)}
	scope :active, -> { where(is_active:true)  }
	scope :deactivated, -> { where(is_active:false,is_approved: true)  }
	scope :to_be_approved, -> { where(is_approved: false)  }
	scope :approved, -> { where(is_approved: true)  }
	# validations
	validates :title,:author, presence: true
	validates :picture, presence: true,on: :create
	validates :isbn,  :isbn_format => true, allow_blank: true
  # validates :isbn10, :isbn_format => { :with => :isbn10 }
  # validates :isbn13, :isbn_format => { :with => :isbn13 }
	mount_uploader :picture, PictureUploader
	#acts_as_x
	acts_as_followable
	acts_as_taggable
	#callbacks
	before_destroy :can_destroy?
	# others
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
	def soft_destroy
		if is_allowed_to_destroy?
			self.is_deleted=false
			self.save
		else
			return false
		end
	end
	def is_allowed_to_destroy?
		self.rates("title").empty? && self.reviews.empty?
	end
	#accepts_nested_attributes_for :reviews
	private
		def can_destroy?
			errors.add(:base, "Cannot delete book with rating or reviews") unless self.is_allowed_to_destroy?
			errors.blank? #return false, to not destroy the element, otherwise, it will delete.
		end
end
