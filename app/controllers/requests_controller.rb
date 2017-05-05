class RequestsController < ApplicationController

  before_action :find_request, only: [:show, :destroy]

  def new
    # create IF-clause so that people dont create new requests for the same dog
    @dog = Dog.find(params[:dog_id])
      if Request.all.where(user_id: current_user, dog_id: @dog.id).last.nil?
        @request = Request.new
        @request.dog = @dog
        @request.messages.build
        authorize @request
      else
        @request = Request.all.where(user_id: current_user).first
        redirect_to request_path(@request)
        authorize @request
      end
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
