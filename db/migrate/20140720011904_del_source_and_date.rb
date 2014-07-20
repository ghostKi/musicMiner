class DelSourceAndDate < ActiveRecord::Migration
  def change
    remove_column :articles, :source, :string
    remove_column :articles, :date, :string

    add_column :articles, :source_id, :int
    add_index :articles, :source_id
    add_column :articles, :published_at, :date
  end
end
