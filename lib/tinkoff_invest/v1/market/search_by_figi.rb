# frozen_string_literal: true

module TinkoffInvest
  module V1
    module Market
      module SearchByFigi
        def search_by_figi(figi:)
          response = connection.get('market/search/by-figi') do |request|
            request.params['figi'] = figi
          end
          response.body if response.success?
        end
      end
    end
  end
end
