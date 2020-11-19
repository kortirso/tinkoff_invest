# frozen_string_literal: true

module TinkoffInvest
  module V1
    module Market
      module Etfs
        def etfs
          response = connection.get('market/etfs')
          response.body if response.success?
        end
      end
    end
  end
end
