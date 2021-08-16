# frozen_string_literal: true

class NpisController < ApplicationController
  skip_before_action :verify_authenticity_token, if: -> { request.format.json? }

  # GET /npis or /npis.json
  def index
    @npis = Npi.ordered
  end

  # GET /npis/1 or /npis/1.json
  def show
    @npi = Npi.find(params[:id])
  end

  # POST /npis or /npis.json
  def create
    @npi = Npi.find_or_initialize_by(npi_params)
    @npi.updated_at = Time.current unless @npi.new_record?

    respond_to do |format|
      if @npi.save
        format.json { render :show, status: :created, location: @npi }
      else
        format.json { render json: @npi.errors.full_messages, status: :unprocessable_entity }
      end
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def npi_params
    params.require(:npi).permit(:number)
  end
end
