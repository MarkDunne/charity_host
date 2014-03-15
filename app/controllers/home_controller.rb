class HomeController < RedirectController
	def index
		self.class.layout 'application'
	end
end
