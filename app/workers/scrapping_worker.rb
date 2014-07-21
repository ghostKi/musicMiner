class ScrappingWorker
  include Sidekiq::Worker
  sidekiq_options queue: :scrap

  def perform(article_id, source_id)

  end
end
