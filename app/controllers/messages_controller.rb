class MessagesController < ApplicationController
  def index
  end

  def new
  end

  def create
    @request = Request.find(params[:request_id])

    @message = Message.new(message_create_params)
    @message.user = @user
    @message.request = @request

    if @message.save respond_to do |format|
      format.html { redirect_to request_path(@request) }
      format.js # <-- will render `app/views/reviews/create.js.erb` end
      end
    else
      respond_to do |format|
      format.html { render 'requests/#{@request.id}' }
      format.js # <-- idem end
      end
    end
  end

  private

  def message_create_params
    params.require(:message).permit(:content, :user_id, :booking_id)
  end

end
