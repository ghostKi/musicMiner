module ScrappingMachine
  class ScrapperPitchfork < Scrapper

    def initialize(article)
      super(article)
      puts "#{self.class.name} initialized"
    end

    def scrap
      @doc = Nokogiri::HTML(open(@article.article_url))

      article_attr = {}
      %w(title body summary).each do |meth|
        article_attr.merge!(self.send(meth))
      end
      article_attr.merge!(scrapped: true)
    end

    private

    ##
    # TODO! h1 and h2 are wayyyyyy to weak for the job. Classes/ids preferred!

    def title
      { title: @doc.xpath('//h1').first.content }
    end

    def body
      { body: @doc.xpath('//div[@class="player-target editorial"]').first
        .content }
    end

    def summary
      { summary: @doc.xpath('//h2').first.content }
    end
  end
end
