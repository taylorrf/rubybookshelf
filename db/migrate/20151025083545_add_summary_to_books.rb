class AddSummaryToBooks < ActiveRecord::Migration
  def change
    add_column :books, :summary, :text
  end
end
