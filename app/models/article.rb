class Article < ActiveRecord::Base
  belongs_to :source

  validates :title, presence: true
end
