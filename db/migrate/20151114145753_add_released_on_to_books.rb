class AddReleasedOnToBooks < ActiveRecord::Migration
  def change
    add_column :books, :released_on, :date, index: :true
  end
end
