class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :owner, except: [:create, :destroy]

  def index
    @posts = Post.all
  end
  def show
  end
  def new
    @post = Post.new
  end

  def edit
  end
  def create
    @post = Post.new(post_params)

      if @post.save
        redirect_to pet_path(@post.pet_id)
      else
        redirect_to pet_path(@post.pet_id)

      end

  end


  def update
      if @post.update(post_params)
        redirect_to pet_path(@post.pet_id)
      else
        redirect_to pet_path(@post.pet_id)
      end
  end

  def destroy
    @post.destroy
    redirect_to pet_path(@post.pet_id)
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_molt
    @post = Molt.find(params[:id])
  end
  def owner
    @pet = current_user.pets.find_by(id: params[:id])
    redirect_to pets_path if @pet.nil?
  end


  # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    params.require(:post).permit(:content, :pet_id)
  end
end
