class DogsController < ApplicationController
  def index
    @dogs = Dog.all
    authorize @dog
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
