# frozen_string_literal: true
# Currency service
class CurrencyService
  attr_reader :base_url, :api_key

  def initialize(base_url, api_key)
    @base_url = base_url
    @api_key = api_key
  end

  def get_currencies_rates(start_date, end_date, base)
    start_date = start_date.to_datetime.strftime('%Y-%m-%d')
    end_date = end_date.to_datetime.strftime('%Y-%m-%d')
    response = api.currencies_rates(start_date, end_date, base)
    parsed_response = JSON.parse(response)
    currencies_infos = parsed_response['rates']
    update_currencies(currencies_infos, end_date, base)
  end

  private

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
end
