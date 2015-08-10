ActiveAdmin.register Book do

 # Create sections on the index screen
 scope :all, default: true
 scope :approved
 scope :deactivated

 # Filterable attributes on the index screen
 filter :title
 filter :author, as: :select #, collection: ->{ Book.reviews }
 # filter :price
 filter :created_at

 # Customize columns displayed on the index screen in the table
 index do
   selectable_column
   column :title
   column :description
   column :author
   column :average_rating,sortable: "rating_caches.avg" do |book|
      book.title_average.try(:avg)
    end
   actions
 end
 batch_action :approve do |ids|
    Book.find(ids).each do |book|
      book.approve
    end
    redirect_to collection_path, alert: "The books have been approved."
  end
  batch_action :deactivate do |ids|
    Book.find(ids).each do |book|
      book.deactivate
    end
    redirect_to collection_path, alert: "The books have been decativated."
  end
  controller do
    def scoped_collection
      super.includes :title_average # prevents N+1 queries to your database
    end
  end
end
