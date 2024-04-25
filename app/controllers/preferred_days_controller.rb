# frozen_string_literal: true

class PreferredDaysController < ApplicationController
  before_action :set_preferred_day, only: %i[show edit update destroy]

  # GET /preferred_days or /preferred_days.json
  def index
    @preferred_days = PreferredDay.all
  end

  # GET /preferred_days/1 or /preferred_days/1.json
  def show; end

  # GET /preferred_days/new
  def new
    @preferred_day = PreferredDay.new
  end

  # GET /preferred_days/1/edit
  def edit; end

  # POST /preferred_days or /preferred_days.json
  def create
    @preferred_day = PreferredDay.new(preferred_day_params)

    respond_to do |format|
      if @preferred_day.save
        format.html { redirect_to preferred_day_url(@preferred_day), notice: 'Preferred day was successfully created.' }
        format.json { render :show, status: :created, location: @preferred_day }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @preferred_day.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /preferred_days/1 or /preferred_days/1.json
  def update
    respond_to do |format|
      if @preferred_day.update(preferred_day_params)
        format.html { redirect_to preferred_day_url(@preferred_day), notice: 'Preferred day was successfully updated.' }
        format.json { render :show, status: :ok, location: @preferred_day }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @preferred_day.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /preferred_days/1 or /preferred_days/1.json
  def destroy
    @preferred_day.destroy!

    respond_to do |format|
      format.html { redirect_to preferred_days_url, notice: 'Preferred day was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_preferred_day
    @preferred_day = PreferredDay.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def preferred_day_params
    params.require(:preferred_day).permit(:description)
  end
end
