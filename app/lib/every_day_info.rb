class EveryDayInfo

    attr_reader :novelties, :articles

    def initialize

        @novelties = Novelty.where("created_at >= ?", 7.days.ago)
        @articles = Article.where("created_at >= ?", 7.days.ago)

        # @novelties = Novelty.all
        # @articles = Article.all
    end

    def empty?
        
        @novelties.count == 0 && @articles.count == 0
    end
    


end