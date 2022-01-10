require './lib/base.rb'
require './lib/coinbase.rb'
require './lib/coin_gecko.rb'
require './lib/coin_paprika.rb'
require './lib/coin_cap.rb'
require './lib/crypto_compare.rb'

module Api
    class Wrapper < Base
        %w[
            coinbase
            coin_gecko
            coin_paprika
            coin_cap
            crypto_compare
        ].each do |api|
            define_method(api.to_sym) do
                Object.const_get("Api::#{klassify(api)}").new(@options).request
            end
        end

        def klassify(name)
            name.split('_').collect(&:capitalize).join
        end
    end
end



