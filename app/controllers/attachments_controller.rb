class AttachmentsController < ApplicationController

  before_filter :load_attachable

  def create
    p params
    @attachment = @attachable.attachments.create(params[:attachment])
    render layout: false, content_type: "text/html"
  end

  def destroy
    @attachment = Attachment.find(params[:id])
    respond_to do |format|
      if @attachment.destroy
        format.json { render :json => @attachment.to_json }
      else
        format.json { render :json => @attachment.to_json, status: :unprocessable_entitt }
      end
    end
  end


  private

  def load_attachable
    resource, id = request.path.split('/')[1, 2]
    @attachable = resource.singularize.classify.constantize.find(id)
  end

end
