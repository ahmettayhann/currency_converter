class Currency < ApplicationRecord
  has_many :base_currency, class_name: 'CurrencyPair', foreign_key: :base_currency_id, dependent: :destroy
  has_many :compared_currency, class_name: 'CurrencyPair', foreign_key: :compared_currency_id, dependent: :destroy
end
