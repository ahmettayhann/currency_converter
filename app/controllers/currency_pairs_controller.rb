class CurrencyPairsController < ApplicationController
  before_action :set_currency_pair, only: %i[ show edit update destroy ]

  # GET /currency_pairs or /currency_pairs.json
  def index
    @currency_pairs = CurrencyPair.all
  end

  # GET /currency_pairs/1 or /currency_pairs/1.json
  def show
  end

  # GET /currency_pairs/new
  def new
    @currency_pair = CurrencyPair.new
  end

  # GET /currency_pairs/1/edit
  def edit
  end

  # POST /currency_pairs or /currency_pairs.json
  def create
    @currency_pair = CurrencyPair.new(currency_pair_params)
    respond_to do |format|
      if @currency_pair.save
        format.html { redirect_to currency_pairs_url, notice: "Currency pair was successfully created." }
        format.json { render :show, status: :created, location: @currency_pair }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @currency_pair.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /currency_pairs/1 or /currency_pairs/1.json
  def update
    respond_to do |format|
      if @currency_pair.update(currency_pair_params)
        format.html { redirect_to currency_pair_url(@currency_pair), notice: "Currency pair was successfully updated." }
        format.json { render :show, status: :ok, location: @currency_pair }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @currency_pair.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /currency_pairs/1 or /currency_pairs/1.json
  def destroy
    @currency_pair.destroy

    respond_to do |format|
      format.html { redirect_to currency_pairs_url, notice: "Currency pair was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_currency_pair
      @currency_pair = CurrencyPair.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def currency_pair_params
      params.require(:currency_pair).permit(:base_currency_id, :compared_currency_id)
    end
end
