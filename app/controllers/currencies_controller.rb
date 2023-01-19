class CurrenciesController < ApplicationController
  before_action :set_currency, only: %i[ show edit update destroy ]

  # GET /currencies or /currencies.json
  def index
    @currencies = Currency.all
  end

  def get_current_rates
    GetCurrenciesRatesJob.perform_later(params[:start_date], params[:end_date], params[:base])
    respond_to do |format|
      format.html { redirect_to currencies_url, notice: "Currency pair was successfully created." }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_currency
    @currency = Currency.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def currency_params
    params.require(:currency).permit(:name, :iso, :base, :rate, :rate_date)
  end
end

