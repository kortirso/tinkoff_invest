# frozen_string_literal: true

module TinkoffInvest
  module V1
    module Market
      module SearchByTicker
        def search_by_ticker(ticker:)
          response = connection.get('market/search/by-ticker') do |request|
            request.params['ticker'] = ticker
          end
          response.body if response.success?
        end
      end
    end
  end
end
