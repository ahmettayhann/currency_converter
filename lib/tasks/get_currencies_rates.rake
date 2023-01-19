namespace :get_currencies_rates do
  desc "Döviz birimleri dolara göre çekilir"
  task get_currencies_rates_today: :environment do
    base = 'USD'
    start_date = Date.yesterday.strftime('%Y-%m-%d')
    end_date = Date.today.strftime('%Y-%m-%d')
    integration = Integration.find_by(name: 'FixerCurrency')
    if integration.present?
      integration.get_currencies_rates(start_date, end_date, base)
    end
  end
end
