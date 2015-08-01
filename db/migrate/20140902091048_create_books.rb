class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.integer :isbn
      t.string :author
      t.text :description
      t.boolean :is_deleted ,default: false
      t.boolean :is_active ,default: false
      t.boolean :is_approved ,default: false
      t.references :user, index: true
      t.timestamps
    end
  end
end
