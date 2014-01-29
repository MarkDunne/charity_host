class AppearanceController < ApplicationController
  def index
  end

  def template
  end

  def update_template
  	@charity.template.update(update_template_params)
  	redirect_to appearance_path(@charity.id)
  end

  private

	def update_template_params
		params.require(:charity_template).permit(:base_template, :text_color)
	end 
end
