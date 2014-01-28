class HomeController < ApplicationController
  def index
  	@charity = Charity.find_by_domain(request.host)
  	if @charity
  		redirect_to :controller => 'charity', :action => 'index', :id => @charity.id
  	end
  end
end
