class CreateListEntries < ActiveRecord::Migration
  def change
    create_table :list_entries do |t|
      t.references :list, index: true, foreign_key: true, null: false
      t.references :book, index: true, foreign_key: true, null: false

      t.timestamps null: false, index: true
    end

    add_index :list_entries, [:list_id, :book_id], unique: true
  end
end
