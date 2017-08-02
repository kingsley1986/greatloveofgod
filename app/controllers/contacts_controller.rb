class ContactsController < ApplicationController

skip_before_action :verify_authenticity_token

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash.now[:error] = nil
      respond_to do |format|
        format.js

      end
    else
      flash.now[:error] = "Cannot send message"
      render :new
    end
  end
end
