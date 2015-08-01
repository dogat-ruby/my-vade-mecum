class ChangeIsbnTypeInBooks < ActiveRecord::Migration
  def up
    change_column :books, :isbn, :string
  end

  def down
    change_column :books, :isbn, :integer
  end
end
