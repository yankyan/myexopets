class PetsController < ApplicationController
  before_action :set_pet, only: [:show, :edit, :update, :destroy]
before_action  :authenticate_user!
  before_action :owner, except: [:index, :new, :create]
  helper_method :sort_column, :sort_direction
  # GET /pets
  # GET /pets.json
  def index
    @pets = current_user.pets.order(sort_column + " " + sort_direction)
  end

  # GET /pets/1
  # GET /pets/1.json
  def show
  end

  # GET /pets/new
  def new
    @pet = current_user.pets.build
    @pet.feedtimes = 1
    @pet.bday = Date.today
  end

  # GET /pets/1/edit
  def edit
  end

  # POST /pets
  # POST /pets.json
  def create
    @pet = current_user.pets.build(pet_params)

    respond_to do |format|
      if @pet.save
        format.html { redirect_to pets_path, notice: 'Информация о питомце успешно сохранена.' }
        format.json { render :show, status: :created, location: @pet }
      else
        format.html { render :new }
        format.json { render json: @pet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pets/1
  # PATCH/PUT /pets/1.json
  def update
    respond_to do |format|
      if @pet.update(pet_params)
        format.html { redirect_to @pet, notice: 'Информация о питомце успешно обновлена.' }
        format.json { render :show, status: :ok, location: @pet }
      else
        format.html { render :edit }
        format.json { render json: @pet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pets/1
  # DELETE /pets/1.json
  def destroy
    @pet.destroy
    respond_to do |format|
      format.html { redirect_to pets_url, notice: 'Информация о питомце успешно удалена' }
      format.json { head :no_content }
    end
  end

  private
  def sort_column
    current_user.pets.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
  def owner
    @pet = current_user.pets.find_by(id: params[:id])
    redirect_to pets_path if @pet.nil?
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_pet
      @pet = Pet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pet_params
      params.require(:pet).permit(:name, :species, :sex, :desk, :bday, :feedtimes)
    end
end
