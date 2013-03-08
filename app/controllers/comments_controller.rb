class CommentsController < ApplicationController

  before_filter :load_commentable


  def create
    p params
    @comment = @commentable.comments.new(params[:comment])
    @comment.user = current_user

    respond_to do |wants|
      if @comment.save
        wants.json { render :json => @comment.to_json }
      else
        wants.json { render :json => @comment.to_json, status: :unprocessable_entity }
      end
    end

  end

  def destroy
    @comment = Attachment.find(params[:id])
    @comment.destroy
  end


  private

  def load_commentable
    resource, id = request.path.split('/')[1, 2]
    @commentable = resource.singularize.classify.constantize.find(id)
  end




end
