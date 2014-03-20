class SettingsController < RedirectController

  layout 'admin'

  def update_settings
  	@charity.settings.update(update_settings_params)
  	redirect_to charity_path
  end

  private

	def update_settings_params
		params.require(:charity_settings).permit(:header_image, :about, :enable_paypal_donations, :paypal_email)
	end 
end
