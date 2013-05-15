class SourceCodesController < ApplicationController

  before_filter :authenticate_user
  before_filter :authenticate_admin, only: [:approve, :reject]
  before_filter :load_source_codeable

  def show
    @source_code = SourceCode.find(params[:id])
    Rails.cache.fetch([:source_code, "file"], raw: true) { fetch_file(@source_code.content.current_path) } if @source_code
  end

  def create
    @source_code = @source_codeable.source_codes.new(params[:source_code])
    @source_code.user = current_user
    @source_code.name = params[:source_code][:content].original_filename

    if @source_code.save
      render layout: false, content_type: "text/html"
    else
      redirect_to @source_codeable, alert: "An error occurred while uploading"
    end
  end

  def approve
    source_code = SourceCode.find(params[:id])
    source_code.approve!
    flash[:notice] = "Successfully Approved"
    redirect_to admin_source_code_path(source_code)
  end

  def reject
    source_code = SourceCode.find(params[:id])
    source_code.reject!
    flash[:notice] = "Successfully Rejected"
    redirect_to admin_source_code_path(source_code)
  end


  private

  def load_source_codeable
    resource, id = request.path.split('/')[1, 2]
    @source_codeable = resource.singularize.classify.constantize.find(id)
  end

  def fetch_file(path)
    connection = Fog::Storage.new({
      :provider                 => 'AWS',
      :aws_access_key_id        => ENV['S3_KEY'],
      :aws_secret_access_key    => ENV['S3_SECRET_KEY']
    })

    directory = connection.directories.get('arduinolabs')
    file = directory.files.get(path)
    file.body if file
  end

end
