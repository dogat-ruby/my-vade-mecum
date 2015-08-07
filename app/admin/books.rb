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
end
