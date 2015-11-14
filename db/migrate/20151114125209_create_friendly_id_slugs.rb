class CreateFriendlyIdSlugs < ActiveRecord::Migration
  def change
    add_column :books, :slug, :string
    add_column :authors, :slug, :string
    add_column :lists, :slug, :string

    add_index :books, :slug, unique: true
    add_index :authors, :slug, unique: true
    add_index :lists, :slug, unique: true
  end
end
