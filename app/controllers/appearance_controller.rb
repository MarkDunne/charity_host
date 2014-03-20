class AppearanceController < RedirectController

  layout 'admin'

  def update_template
  	@charity.settings.update_attributes(update_appearance_params)
  	redirect_to charity_path(@charity)
  	flash[:notice] = "Template Updated"
  end

  private

	def update_appearance_params
		params.require(:charity_settings).permit(:header_image, :base_style, :text_color)
	end 
end
