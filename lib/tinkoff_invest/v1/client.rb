# frozen_string_literal: true

require 'faraday'
require 'faraday_middleware'
require 'dry/initializer'
require_relative 'market/stocks'
require_relative 'market/bonds'
require_relative 'market/etfs'
require_relative 'market/orderbook'
require_relative 'market/search_by_figi'
require_relative 'market/search_by_ticker'

module TinkoffInvest
  module V1
    class Client
      extend Dry::Initializer
      include TinkoffInvest::V1::Market::Stocks
      include TinkoffInvest::V1::Market::Bonds
      include TinkoffInvest::V1::Market::Etfs
      include TinkoffInvest::V1::Market::Orderbook
      include TinkoffInvest::V1::Market::SearchByFigi
      include TinkoffInvest::V1::Market::SearchByTicker

      option :token
      option :sandbox, default: proc { true }
      option :url, default: proc { 'https://api-invest.tinkoff.ru/openapi' }
      option :connection, default: proc { build_connection }

      private

      def build_connection
        Faraday.new(base_url, headers: connection_headers) do |conn|
          conn.request :json
          conn.response :json, content_type: /\bjson$/
          conn.adapter Faraday.default_adapter
        end
      end

      def base_url
        return @url unless @sandbox

        "#{@url}/sandbox"
      end

      def connection_headers
        {
          'Authorization' => "Bearer #{@token}"
        }
      end
    end
  end
end
