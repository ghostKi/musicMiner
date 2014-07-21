class Article < ActiveRecord::Base
  belongs_to :source
  before_create :sha1_article

  validates :title, presence: true

  delegate :source_name, to: :source, prefix: false

  scope :descendent, ->(){ order('articles.published_at DESC') }
  scope :scrapped, ->(){ where(scrapped: true) }

  def scrap!
    update_attributes(scrapped: true)
  end

  private

  def sha1_article
    self.check_sum = Digest::SHA1.hexdigest "#{source_name}_#{article_url}"
  end
end
