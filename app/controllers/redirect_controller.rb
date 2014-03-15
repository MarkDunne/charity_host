class RedirectController < ApplicationController
	def redirect_to_charity
		redirect_to charity_path(@charity) #enable redirects
	end
end
