class ScrappingWorker
  include Sidekiq::Worker
  sidekiq_options queue: :scrap

  def perform(article_ids, source_id)
    source = Source.find_by(id: source_id)
    return if source.source_name == 'fact'
    #binding.pry
    articles = source.articles.where(id: article_ids)

    articles.each do |article|
      scrap_result = source_class(source).new(article).scrap
      puts "Scrap with attributes:"
      puts scrap_result
      article.update_attributes(scrap_result)
    end
  end

  def source_class(source)
    "ScrappingMachine::Scrapper#{source.source_name.capitalize}".constantize
  end
end
