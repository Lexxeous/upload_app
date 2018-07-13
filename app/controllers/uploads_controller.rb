class UploadsController < ApplicationController
  def new
  end

  def create
    # Make an object in your bucket for your upload
    binding.pry
    # obj = S3_BUCKET.object_id[params[:file].original_filename]

    s3 = Aws::S3::Resource.new(region: REGION)
		obj = s3.bucket(S3_BUCKET).object(AWS_SECRET_ACCESS_KEY)
		obj.upload_file("/Users/alex/Desktop/WPB.jpg")

    # Upload the file
    # obj.write(
    #   file: params[:file],
    #   acl: :public_read
    # )

    # Create an object for the upload
    @upload = Upload.new(
    	url: obj.public_url,
		  name: obj.key
    )

    # Save the upload
    if @upload.save
      redirect_to uploads_path, success: 'File successfully uploaded'
    else
      flash.now[:notice] = 'There was an error'
      render :new
    end
  end

  def index
  	@uploads = Upload.all
  end
end