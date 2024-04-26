# frozen_string_literal: true

class PreferredClassesController < ApplicationController
  before_action :set_preferred_class, only: %i[show edit update destroy]

  # GET /preferred_classes or /preferred_classes.json
  def index
    @preferred_classes = PreferredClass.all
  end

  # GET /preferred_classes/1 or /preferred_classes/1.json
  def show; end

  # GET /preferred_classes/new
  def new
    @preferred_class = PreferredClass.new
  end

  # GET /preferred_classes/1/edit
  def edit; end

  # POST /preferred_classes or /preferred_classes.json
  def create
    @preferred_class = PreferredClass.new(preferred_class_params)

    respond_to do |format|
      if @preferred_class.save
        format.html do
          redirect_to preferred_class_url(@preferred_class), notice: 'Preferred class was successfully created.'
        end
        format.json { render :show, status: :created, location: @preferred_class }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @preferred_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /preferred_classes/1 or /preferred_classes/1.json
  def update
    respond_to do |format|
      if @preferred_class.update(preferred_class_params)
        format.html do
          redirect_to preferred_class_url(@preferred_class), notice: 'Preferred class was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @preferred_class }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @preferred_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /preferred_classes/1 or /preferred_classes/1.json
  def destroy
    @preferred_class.destroy!

    respond_to do |format|
      format.html { redirect_to preferred_classes_url, notice: 'Preferred class was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_preferred_class
    @preferred_class = PreferredClass.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def preferred_class_params
    params.require(:preferred_class).permit(:description)
  end
end
