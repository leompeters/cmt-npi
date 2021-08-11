# frozen_string_literal: true

class NpisController < ApplicationController
  before_action :set_npi, only: %i[show edit update destroy]
  skip_before_action :verify_authenticity_token, if: -> { request.format.json? }

  # GET /npis or /npis.json
  def index
    @npis = Npi.all
  end

  # GET /npis/1 or /npis/1.json
  def show; end

  # GET /npis/new
  def new
    @npi = Npi.new
  end

  # GET /npis/1/edit
  def edit; end

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

  # PATCH/PUT /npis/1 or /npis/1.json
  def update
    respond_to do |format|
      if @npi.update(npi_params)
        format.html { redirect_to @npi, notice: 'Npi was successfully updated.' }
        format.json { render :show, status: :ok, location: @npi }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @npi.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /npis/1 or /npis/1.json
  def destroy
    @npi.destroy!
    respond_to do |format|
      format.html { redirect_to npis_url, notice: 'Npi was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_npi
    @npi = Npi.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def npi_params
    params.require(:npi).permit(:number)
  end
end
