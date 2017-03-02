class WetsController < ApplicationController
  before_action :set_wet, only: [:show, :edit, :update, :destroy]
  before_action  :authenticate_user!
  before_action :owner, except: [:create, :destroy]

  # GET /wets
  # GET /wets.json
  def index
    @wets = Wet.all
  end
  def pet_wets
    @wets = Pet.find(params.require(:id).to_i).wets
    render :index
  end
  # GET /wets/1
  # GET /wets/1.json
  def show
  end

  # GET /wets/new
  def new
    @wet = Wet.new
  end

  # GET /wets/1/edit
  def edit
  end

  # POST /wets
  # POST /wets.json
  def create
    @wet = Wet.new(wet_params)

    respond_to do |format|
      if @wet.save
        nextwetset
        format.html { redirect_to pet_path(@wet.pet_id), notice: 'Данные об увлажнении успешно сохранены.' }
        format.json { render :show, status: :created, location: @wet }
      else
        format.html { render :new }
        format.json { render json: @wet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wets/1
  # PATCH/PUT /wets/1.json
  def update
    respond_to do |format|
      if @wet.update(wet_params)
        format.html { redirect_to pet_path(@wet.pet_id), notice: 'Данные об увлажнении успешно сохранены.' }
        format.json { render :show, status: :ok, location: @wet }
      else
        format.html { render :edit }
        format.json { render json: @wet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wets/1
  # DELETE /wets/1.json
  def destroy
    @wet.destroy
    nextwetset
    respond_to do |format|
      format.html { redirect_to pet_path(@wet.pet_id), notice: 'Данные об увлажнении успешно удалены.' }
      format.json { head :no_content }
    end
  end

  private
  def nextwetset
    @pet=Pet.find(@wet.pet_id)
    if @pet.wets.last.nil?
      @pet.nextwet = Date.today
    elsif
    @pet.nextwet=@pet.wets.order(:date).last.date+@pet.wettime.to_i
    end
    @pet.save
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_wet
      @wet = Wet.find(params[:id])
    end
  def owner
    @pet = current_user.pets.find_by(id: params[:id])
    redirect_to pets_path if @pet.nil?
  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wet_params
      params.require(:wet).permit(:pet_id, :date)
    end
end
