class AttachmentsController < ApplicationController
  def index
  end

  def show
    @attachment = Attachment.find(params[:id])
    send_data @attachment.filedata,
              type: 'image/jpeg',
              disposition: 'inline'
  end
end
