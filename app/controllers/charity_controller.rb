class CharityController < ApplicationController
	def index
		@charity = Charity.find_by_id(params[:id])
		if !@charity
			redirect_to :controller => 'home', :action => 'index'
		end
	end

	def create
		@charity = Charity.new(new_charity_params)
		if @charity.save
			render :text => 'created'
		else
			render :text => 'failed'
		end
	end

	private

	def new_charity_params
		params.require(:charity).permit(:name, :domain)
	end 

end
