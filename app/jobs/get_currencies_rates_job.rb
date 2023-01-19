# frozen_string_literal: true

class GetCurrenciesRatesJob < ApplicationJob

  sidekiq_options retry: false

  queue_as Rails.env.production? ? "#{Rails.env}_light" : Rails.env

  def perform(start_date, end_date, base)
    start_date ||= Date.today
    end_date ||= Date.today
    base ||= 'USD'
    service = CurrencyService.new(base_url, api_key)
    service.get_currencies_rates(start_date, end_date, base)
  end

  def base_url
    'https://api.apilayer.com/fixer'
  end

  def api_key
    'rcD5wIJKZZ3a9HVT6uKAyVVMI5gzg4po'
  end
end
