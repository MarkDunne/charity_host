class AppearanceController < ApplicationController
  def update_template
  	@charity.settings.update(update_appearance_params)
  	redirect_to appearance_path(@charity.id)
  end

  private

	def update_appearance_params
		params.require(:charity_settings).permit(:base_template, :text_color)
	end 
end
