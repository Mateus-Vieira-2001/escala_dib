# frozen_string_literal: true

# Controller for managing TypeProfile
class TypeProfilesController < ApplicationController
  before_action :set_type_profile, only: %i[show edit update destroy]

  # GET /type_profiles or /type_profiles.json
  def index
    @type_profiles = TypeProfile.all
  end

  # GET /type_profiles/1 or /type_profiles/1.json
  def show; end

  # GET /type_profiles/new
  def new
    @type_profile = TypeProfile.new
  end

  # GET /type_profiles/1/edit
  def edit; end

  # POST /type_profiles or /type_profiles.json
  def create
    @type_profile = TypeProfile.new(type_profile_params)

    respond_to do |format|
      if @type_profile.save
        format.html { redirect_to type_profile_url(@type_profile), notice: 'Type profile was successfully created.' }
        format.json { render :show, status: :created, location: @type_profile }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @type_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /type_profiles/1 or /type_profiles/1.json
  def update
    respond_to do |format|
      if @type_profile.update(type_profile_params)
        format.html { redirect_to type_profile_url(@type_profile), notice: 'Type profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @type_profile }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @type_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /type_profiles/1 or /type_profiles/1.json
  def destroy
    @type_profile.destroy!

    respond_to do |format|
      format.html { redirect_to type_profiles_url, notice: 'Type profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_type_profile
    @type_profile = TypeProfile.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def type_profile_params
    params.require(:type_profile).permit(:description)
  end
end
