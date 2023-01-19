# frozen_string_literal: true

class GetCurrenciesRatesCronJob < ApplicationJob

  sidekiq_options retry: false

  queue_as Rails.env.production? ? "#{Rails.env}_light" : Rails.env

  def perform
    start_date ||= Date.today
    end_date ||= Date.today
    base ||= 'USD'
    GetCurrenciesRatesJob.perform_now(start_date, end_date, base)
  end
end