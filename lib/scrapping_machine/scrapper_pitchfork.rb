module ScrappingMachine
  class ScrapperPitchfork < Scrapper

    def initialize(article)
      super(article)
      puts "#{self.class.name} initialized"
    end

    def scrap
      doc = Nokogiri::HTML(open(@article.article_url))

      article_attr = {}

      article_attr[:title] = doc.xpath('//h1').first.content
      puts article_attr[:title]

      doc.xpath('//div[@class="player-target editorial"]').each do |link|
        article_attr[:body] = link.content
        puts link.content
      end
      doc.xpath('//h2').each do |link|
        article_attr[:summary] = link.content
        puts link.content
      end
      doc.xpath('//span[@class="pubdate"]').each do |link|
        article_attr[:published_at] = link.content
        puts link.content
      end

      article_attr[:scrapped] = true
      return article_attr
    end
  end
end
