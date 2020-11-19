# frozen_string_literal: true

require_relative 'tinkoff_invest/version'
require_relative 'tinkoff_invest/v1/client'

module TinkoffInvest
  class Error < StandardError; end
end
