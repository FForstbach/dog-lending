class DogsController < ApplicationController

    skip_before_action :authenticate_user!, only: [:index, :show, :new]
    before_action :find_dog, only: [:update, :destroy]


  def index
    @dogs = policy_scope(Dog).order(created_at: :desc)
    # @dogs = @dogs.where.not(latitude: nil, longitude: nil)
    @hash = Gmaps4rails.build_markers(@dogs) do |dog, marker|
      marker.lat dog.latitude
      marker.lng dog.longitude
      # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
    end
  end

  def show
    @dog = Dog.find(params[:id])
    authorize @dog
  end

  def new
    @dog = Dog.new
    authorize @dog
  end

  def create
    authorize @dog
    @dog = Dog.new(strong_params)
    # @dog.name = params[:dog][:name]
    # @dog.breed = params[:dog][:breed]
    # @dog.age = params[:dog][:age]
    # @dog.description = params[:dog][:description]
    # @dog.size = params[:dog][:size]
    # @dog.photo = params[:dog][:photo]
    # @dog.user = current_user
    # @dog.location = params[:dog][:location]
    @dog.save
    redirect_to dogs_path
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def strong_params
    params.require(:dog).permit(:name, :breed, :age, :user, :description, :size, :photo, :photo_cache, :location)
  end

  def find_dog
    @dog = Dog.find(params[:id])
    authorize @dog
  end

end
