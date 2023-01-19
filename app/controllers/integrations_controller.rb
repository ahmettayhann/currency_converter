class IntegrationsController < ApplicationController
  before_action :set_integration, only: %i[ update destroy ]

  def index
    integrations = Integration.all
  end

  def show
  end

  def new
    @integration = Integration.new
  end

  def edit
  end

  def create
    integration = Integration.new(integration_params)

    respond_to do |format|
      if integration.save
        format.html { redirect_to integration_url(@integration), notice: "Integration was successfully created." }
        format.json { render :show, status: :created, location: @integration }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @integration.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @integration.update(integration_params)
        format.html { redirect_to integration_url(integration), notice: "Integration was successfully updated." }
        format.json { render :show, status: :ok, location: @integration }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @integration.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @integration.destroy

    respond_to do |format|
      format.html { redirect_to integrations_url, notice: "Integration was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_integration
    @integration = Integration.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def integration_params
    params.require(:integration).permit(:name, :type, :activation_date, parameters_attributes: [:name, :value])
  end
end
