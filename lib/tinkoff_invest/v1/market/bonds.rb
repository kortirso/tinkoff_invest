# frozen_string_literal: true

module TinkoffInvest
  module V1
    module Market
      module Bonds
        def bonds
          response = connection.get('market/bonds')
          response.body if response.success?
        end
      end
    end
  end
end
