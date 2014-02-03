class UploadController < ApplicationController
  def index
  end

  def upload
  	charityFile = CharityFile.new(upload_file_params)
  	charityFile.charity = @charity
  	if charityFile.save
  		flash[:notice] = "File Upload Successful"
  	else
  		flash[:alert] = "File Upload Failed"
  	end
  	redirect_to upload_path
  end

  private

	def upload_file_params
		params.require(:charity_file).permit(:file)
	end 
end
