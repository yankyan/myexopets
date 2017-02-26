class MoltsController < ApplicationController
  before_action :set_molt, only: [:show, :edit, :update, :destroy]
  before_action :owner, except: [:create, :destroy]

  # GET /molts
  # GET /molts.json
  def index
    @molts = Molt.all
  end

  # GET /molts/1
  # GET /molts/1.json
  def show
  end

  # GET /molts/new
  def new
    @molt = Molt.new
  end

  # GET /molts/1/edit
  def edit
  end

  # POST /molts
  # POST /molts.json
  def create
    @molt = Molt.new(molt_params)

    respond_to do |format|
      if @molt.save
        format.html { redirect_to pet_path(@molt.pet_id), notice: 'Molt was successfully created.' }
        format.json { render :show, status: :created, location: @molt }
      else
        format.html { render :new }
        format.json { render json: @molt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /molts/1
  # PATCH/PUT /molts/1.json
  def update
    respond_to do |format|
      if @molt.update(molt_params)
        format.html { redirect_to pet_path(@molt.pet_id), notice: 'Molt was successfully updated.' }
        format.json { render :show, status: :ok, location: @molt }
      else
        format.html { render :edit }
        format.json { render json: @molt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /molts/1
  # DELETE /molts/1.json
  def destroy
    @molt.destroy
    respond_to do |format|
      format.html { redirect_to pet_path(@molt.pet_id), notice: 'Molt was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_molt
      @molt = Molt.find(params[:id])
    end
  def owner
    @pet = current_user.pets.find_by(id: params[:id])
    redirect_to pets_path if @pet.nil?
  end


    # Never trust parameters from the scary internet, only allow the white list through.
    def molt_params
      params.require(:molt).permit(:date, :pet_id)
    end
end
