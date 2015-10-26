class CreateLists < ActiveRecord::Migration
  # TODO: any indices needed?
  def change
    create_table :lists do |t|
      t.string :name, null: false

      t.timestamps null: false
    end
  end
end
