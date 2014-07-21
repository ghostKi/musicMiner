module ScrappingMachine
  class Scrapper
    attr_accessor :article
    def initialize(article)
      @article = article
    end

    def scrap
      raise 'Scrap called on super class!'
    end
  end
end
