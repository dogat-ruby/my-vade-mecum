class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :bk_title
      t.integer :bk_isbn
      t.string :bk_author

      t.timestamps
    end
  end
end
