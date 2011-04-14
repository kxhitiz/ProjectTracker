class MessagesController < ApplicationController
  before_filter :authenticate_person!

  def index
    @person = current_person
    @messages = @person.messages.order("created_at DESC")
  end

  def destroy
    @person = Person.find(params[:person_id])
    @message = @person.messages.find(params[:id])
    if @message.destroy
      redirect_to person_messages_path(@person), :notice => "Message Deleted Successfully"
    else
      redirect_to person_messages_path(@person), :alert => "Oops! Delete Unsuccessfull, try Again"
    end
  end

end

