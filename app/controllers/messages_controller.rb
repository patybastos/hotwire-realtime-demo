class MessagesController < ApplicationController
  def index
    @messages = Message.order(:created_at)
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)

    if @message.save
      redirect_to root_path, status: :see_other
    else
      @messages = Message.order(:created_at)
      render :index, status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.expect(message: %i[username content])
  end
end
