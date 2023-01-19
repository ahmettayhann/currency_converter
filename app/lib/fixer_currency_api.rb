# frozen_string_literal: true

class FixerCurrencyApi

  require "uri"
  require "net/http"

  def initialize(base_url, api_key)
    @base_url = base_url
    @api_key = api_key
  end

  def currencies_rates(start_date, end_date, base)
    url = URI("#{@base_url}/fluctuation?start_date=#{start_date}&end_date=#{end_date}&base=#{base}")
    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request['apikey'] = @api_key

    response = https.request(request)
    response.body
  end
end
