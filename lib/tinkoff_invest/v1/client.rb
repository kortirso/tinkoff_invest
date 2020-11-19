# frozen_string_literal: true

require 'faraday'
require 'faraday_middleware'
require 'dry/initializer'
require_relative 'market/stocks'

module TinkoffInvest
  module V1
    class Client
      extend Dry::Initializer
      include TinkoffInvest::V1::Market::Stocks

      option :token
      option :sandbox, default: proc { true }
      option :url, default: proc { 'https://api-invest.tinkoff.ru/openapi' }
      option :connection, default: proc { build_connection }

      private

      def build_connection
        Faraday.new(base_url, headers: connection_header) do |conn|
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
