class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :summary
      t.text :body
      t.string :photo_path
      t.string :date
      t.string :source

      t.timestamps
    end
  end
end
