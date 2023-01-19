module CurrencyPairsHelper

  def currency_calculation(currency_pair)
      base_currency = Currency.find(currency_pair.base_currency_id)
      compared_currency = Currency.find(currency_pair.compared_currency_id)
      rate = base_currency.rate/compared_currency.rate
      [base_currency.name, compared_currency.name, rate.round(3)]
  end
end
