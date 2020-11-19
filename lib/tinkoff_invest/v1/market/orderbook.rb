# frozen_string_literal: true

module TinkoffInvest
  module V1
    module Market
      module Orderbook
        def orderbook(figi:, depth: 0)
          response = connection.get('market/orderbook') do |request|
            request.params['figi'] = figi
            request.params['depth'] = depth
          end
          response.body if response.success?
        end
      end
    end
  end
end
