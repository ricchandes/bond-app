class MessagesController < ApplicationController
  def show
    @messages =  Message.all
  end

  def new
  end
end
