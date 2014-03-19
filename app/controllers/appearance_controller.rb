class AppearanceController < RedirectController

  layout 'admin'

  def update_template
  	@charity.settings.update_attributes(update_appearance_params)
  	redirect_to charity_path(@charity)
  end

  private

	def update_appearance_params
		params.require(:charity_settings).permit(:base_template, :text_color)
	end 
end
