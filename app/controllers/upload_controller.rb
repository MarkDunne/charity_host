class UploadController < RedirectController
  def index
  end

  def show
    file = @charity.uploads.select{|upload| upload.file.url == request.path}.first.file
    send_file file.current_path,:disposition => 'inline'
  end

  def upload
  	charityFile = CharityFile.new(upload_file_params)
  	charityFile.charity = @charity
  	if charityFile.save
  		flash[:notice] = "File Upload Successful"
  	else
  		flash[:error] = "File Upload Failed"
  	end
  	redirect_to upload_path
  end

  private

	def upload_file_params
		params.require(:charity_file).permit(:file)
	end 
end
