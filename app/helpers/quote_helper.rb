module QuoteHelper
    def get_quote
        @quote = HTTParty.get('https://api.quotable.io/random?tags=inspirational')
    end

end
