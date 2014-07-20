class CreateSources < ActiveRecord::Migration
  def change
    create_table :sources do |t|
      t.string :source_name
      t.string :source_url

      t.timestamps
    end
  end
end
