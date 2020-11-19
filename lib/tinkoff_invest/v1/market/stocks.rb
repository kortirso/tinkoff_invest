# frozen_string_literal: true

module TinkoffInvest
  module V1
    module Market
      module Stocks
        def stocks
          response = connection.get('market/stocks')
          response.body if response.success?
        end
      end
    end
  end
end
