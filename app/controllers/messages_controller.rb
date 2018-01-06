class MessagesController < ApplicationController
    def new
        @message = Message.new
    end

    def create
        @message = Message.new message_params

        if @message.valid?
            MessageMailer.contact(@message).deliver_now
            redirect_to '/'
            flash[:notice] = "Thanks for the message!"
        else
            flash[:notice] = "There was a problem sending the message"
            render :new
        end
    end
    private

    def message_params
        params.require(:message).permit(:name, :email, :body)
    end
end
