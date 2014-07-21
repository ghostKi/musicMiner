class CreateChecksum < ActiveRecord::Migration
  def change
    add_column :articles, :check_sum, :string
    add_index :articles, :check_sum, unique: true
  end
end
