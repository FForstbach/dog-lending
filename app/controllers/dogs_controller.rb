class DogsController < ApplicationController

    skip_before_action :authenticate_user!, only: [:index, :show, :new]

  def index
    @dogs = policy_scope(Dog).order(created_at: :desc)
    @dogs = Dog.where.not(latitude: nil, longitude: nil)
    @hash = Gmaps4rails.build_markers(@flats) do |dog, marker|
    marker.lat dog.latitude
    marker.lng dog.longitude
    # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
  end

  def show
    @dog = Dog.find(params[:id])
  end

  def new
    @dog = Dog.new
    authorize @dog
  end

  def create
    @dog = Dog.find(params[:id])
  end

  def edit
  end

  def update
    @dog = Dog.find(params[:id])
  end

  def destroy
    @dog = Dog.find(params[:id])
  end



end
