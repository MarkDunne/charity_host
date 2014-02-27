class HomeController < ApplicationController
	def index
		self.class.layout 'application'
	end
end
