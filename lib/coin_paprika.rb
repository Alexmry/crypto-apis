module Api
    class CoinPaprika < Base
        def request
            super(:get, url)
        end

        def parsed_response(response)
            response.first.dig('close').to_f
        end

        def url
            "https://api.coinpaprika.com/v1/coins/#{@options[:symbol]}-#{@options[:name]}/ohlcv/today"
            # "https://api.coinpaprika.com/v1/coins/btc-bitcoin/ohlcv/today"
        end
    end
end