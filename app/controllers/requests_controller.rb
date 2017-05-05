class RequestsController < ApplicationController

  before_action :find_request, only: [:show, :destroy]

  def new
    @dog = Dog.find(params[:dog_id])
    @request = Request.new
    @request.dog = @dog
    @request.messages.build
    authorize @request
  end

  def create
    @request = Request.new(strong_params)
    @request.user = current_user
    authorize @request
    @request.save
    redirect_to requests_path
  end

  def index
    @requests = policy_scope(Request)
    @last_message = @requests.last.messages.last
    @user = current_user
  end

  def show
    @dog = @request.dog
    @message = Message.new
  end

  def destroy
  end

  private

  def find_request
    @request = Request.find(params[:id])
    authorize @request
  end

  def strong_params
    params.require(:request).permit(:dog_id, :messages_attributes => [:content])
  end
end
