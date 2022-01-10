require 'httparty'

module Api
    class Base
        attr_accessor :options
        def initialize(options)
            @options = options
        end

        def request(type, url, opts = {})
            HTTParty.send(type, url, opts).yield_self do |response|
                #parse the response
                parsed_response(response)
            end
        end

        def parsed_response(response)
            #we get only the price from the ipa response
            "#{__method__}"
        end
    end
end