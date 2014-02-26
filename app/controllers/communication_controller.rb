class CommunicationController < ApplicationController

  def index
  end

  def create_message
  	message = @charity.messages.new(new_message_params)
  	message.user = current_user
  	if message.save
  		flash[:notice] = "Message created successfully"
  	else
  		flash[:alert] = "Error creating message"
  	end

  	redirect_to communication_path(@charity, :index)
  end

  private

  	def new_message_params
		params.require(:message).permit(:content)
	end 
end
