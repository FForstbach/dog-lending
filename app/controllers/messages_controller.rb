class MessagesController < ApplicationController
  def index
  end

  def new
  end

  def create
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
end
