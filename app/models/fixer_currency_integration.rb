# frozen_string_literal: true

class FixerCurrencyIntegration < Integration
  attr_reader :base_url, :api_key

  after_initialize :init, if: :new_record?

  def init
    self.name = 'FixerCurrency'
  end

  def get_currencies_rates(start_date, end_date, base)
    start_date = start_date.to_datetime.strftime('%Y-%m-%d')
    end_date = end_date.to_datetime.strftime('%Y-%m-%d')
    response = api.currencies_rates(start_date, end_date, base)
    parsed_response = JSON.parse(response)
    currencies_infos = parsed_response['rates']
    update_currencies(currencies_infos, end_date, base)
  end

  def update_currencies(currencies_infos, end_date, base)
    currencies_infos.each do |currencies_info|
      create_or_update_currency(currencies_info, end_date, base)
    end
  end

  def create_or_update_currency(currencies_info, end_date, base)
    currency = Currency.find_or_initialize_by(name: currencies_info.first, iso: currencies_info.first, base: base)
    currency.rate = currencies_info.last['end_rate']
    currency.rate_date = end_date
    currency.save
  end

  def api
    @_api = FixerCurrencyApi.new(base_url, api_key)
  end

  private

  def base_url
    @base_url = parameters.find_by(name:'base_url')&.value
  end

  def api_key
    @api_key = parameters.find_by(name: 'api_key')&.value
  end
end