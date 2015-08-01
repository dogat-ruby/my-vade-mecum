class AddTagsToBooks < ActiveRecord::Migration
  def change
  	# execute "create extension hstore"
    # add_column :books, :tags, :hstore
    add_index :books, :title
    # add_index :books, :tags
  end
end
