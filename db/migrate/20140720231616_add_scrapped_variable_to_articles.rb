class AddScrappedVariableToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :scrapped, :boolean, default: false
    add_index :articles, :scrapped
  end
end
