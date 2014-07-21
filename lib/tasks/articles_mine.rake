  namespace :articles do
    desc "Task that gets the articles"
    task :mine => :environment do
      @sources = Source.all
      @sources.each do |source|
        puts "Loading source #{source.source_name}".green

        feed = Feedjira::Feed.fetch_and_parse(source.source_url)

        source_articles = []
        feed.entries.each do |entry|
          begin
            @article = Article.create!(
              title: entry.title,
              source: source,
              published_at: entry.published,
              article_url: entry.url)
            source_articles += Array(@article.id)

          rescue ActiveRecord::RecordNotUnique => e
            puts "Article #{entry.title} already on database"
          end
          puts "Article #{@article.title} saved!" if @article
        end
        ##
        # Launch workers!
        # sidekiq
        ScrappingWorker.perform_async(source_articles, source.id)
      end
    end
  end
