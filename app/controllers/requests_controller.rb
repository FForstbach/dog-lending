class RequestsController < ApplicationController

  before_action :find_request, only: [:show, :destroy]

  def new
    # IF-clause so that people dont create new requests for the same dog
    @dog = Dog.find(params[:dog_id])
      if Request.where(user_id: current_user, dog_id: @dog.id).count == 0
        @request = Request.new
        @request.dog = @dog
        @request.messages.build
        authorize @request
      else
        @request = Request.all.where(user_id: current_user).first
        redirect_to request_path(@request), flash: {notice: "Continue talking to #{@dog.name}"}
        authorize @request
      end
  end

  def create
    @request = Request.new(strong_params)
    @request.user = current_user
    authorize @request
    @request.messages.first.user = current_user
    @request.save!
    redirect_to request_path(@request), flash: {notice: "New request created"}
  end

  def index
    @requests = policy_scope(Request)
    @last_message = @requests.last.messages.last
    @user = current_user
  end

  def show
    @dog = @request.dog
    @request_messages = @request.messages.sort_by {|msg| msg.created_at}
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
