# frozen_string_literal: true

class NpisController < ApplicationController
  skip_before_action :verify_authenticity_token, if: -> { request.format.json? }

  # GET /npis or /npis.json
  def index
    @npis = Npi.all
  end

  # POST /npis or /npis.json
  def create
    @npi = Npi.find_or_initialize_by(number: npi_params[:number])

    respond_to do |format|
      if @npi.save
        format.html { redirect_to @npi, notice: 'Npi was successfully created.' }
        format.json { render :show, status: :created, location: @npi }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @npi.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def npi_params
    params.require(:npi).permit(:number)
  end
end
