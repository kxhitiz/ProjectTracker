class MessagesController < ApplicationController
  def index
    @person = current_person
    @messages = @person.messages

  end

  def show
  end

end

