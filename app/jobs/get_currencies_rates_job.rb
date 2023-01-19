# frozen_string_literal: true

class GetCurrenciesRatesJob < ApplicationJob

  def perform(start_date, end_date, base)
    start_date ||= Date.today
    end_date ||= Date.today
    base ||= 'USD'
    integration = Integration.find_by(name: 'FixerCurrency')
    raise StandardError, 'Entegrasyon bulunamadı' unless integration.present?

    if integration.present?
      integration.get_currencies_rates(start_date, end_date, base)
    end
  end
end