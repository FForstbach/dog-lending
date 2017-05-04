class RequestsController < ApplicationController

  before_action :find_request, only: [:show, :destroy]

  def new
    @message = Message.new
    @dog = Dog.new
  end

  def create
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
  end
end
