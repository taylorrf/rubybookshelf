class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title, index: true, null: false

      t.timestamps null: false
    end
  end
end
