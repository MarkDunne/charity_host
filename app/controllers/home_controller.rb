class HomeController < ApplicationController

	before_filter :redirect_to_charity_if_rendering

	def index

	end

	private

	def redirect_to_charity_if_rendering
		if @is_rendering_charity
			redirect_to :controller => 'charity', :action => 'show', :id => @charity.id		
		end
	end
end
