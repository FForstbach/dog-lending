class MessagesController < ApplicationController
  def index
  end

  def new
  end

  def create
    @request = Request.find(params[:request_id])
    @message = @request.messages.new(message_create_params)
    @message.user_id = current_user.id
    authorize @request
    authorize @message

    if @message.save
      respond_to do |format|
        format.js # <-- will render `app/views/messages/create.js.erb` end
      end
    else
      respond_to do |format|
        format.js # <-- idem end
      end
    end
  end

  private

  def message_create_params
    params.require(:message).permit(:content, :request_id)
  end

end
