ActiveAdmin.register User do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end
form partial: 'form'
# Create sections on the index screen
  scope :all, default: true
  scope :blocked
  # Customize columns displayed on the index screen in the table
  index do
   selectable_column
   column :user_name
   column :email
   actions
  end
  batch_action :block do |ids|
   User.find(ids).each do |user|
     user.block
   end
   redirect_to collection_path, alert: "The users have been blocked."
 end
 batch_action :unblock do |ids|
   User.find(ids).each do |user|
     user.unblock
   end
   redirect_to collection_path, alert: "The users have been unblocked."
 end
end
