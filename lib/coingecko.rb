module Api
    class CoinGecko < Base
        def request
            super(:get, url)
        end

        def parsed_response(response)
            response.dig('tickers').first.dig('last')
        end

        def url
            "https://api.coingecko.com/api/v3/coins/#{@options[:name]}"
        end
    end
end

# https://api.coingecko.com/api/v3/coins/bitcoin