class MessagesController < ApplicationController
  def index
  end

  def new
  end

  def create
    @request = Request.find(params[:request_id])
    @message = Message.new(message_create_params)
    authorize @request
    authorize @message
    @message.user_id = current_user.id
    @message.request_id = @request.id

    if @message.save
        respond_to do |format|
        format.html { redirect_to request_path(@request) }
        format.js # <-- will render `app/views/reviews/create.js.erb` end
        end
    else
      respond_to do |format|
        format.html { redirect_to request_path(@request) }
        format.js # <-- idem end
      end
    end
    authorize @request
    authorize @message
  end

  private

  def message_create_params
    params.require(:message).permit(:content, :user_id, :request_id)
  end

end
