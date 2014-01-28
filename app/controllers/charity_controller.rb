class CharityController < ApplicationController
	def index
		@charity = Charity.find_by_id(params[:id])
		if !@charity
			redirect_to :controller => 'home', :action => 'index'
		end
	end

	def create
		if !user_signed_in?
			flash[:alert] = "You must be signed in to create a charity"
		else
			@charity = Charity.new(new_charity_params)
			if @charity.save && CharitiesUsers.create(user_id: current_user.id, charity_id: @charity.id)
				flash[:notice] = 'Charity created successfully'
			else
				flash[:alert] = 'Error while creating charity'
			end
		end
		redirect_to :back
	end

	private

	def new_charity_params
		params.require(:charity).permit(:name, :domain)
	end 

end
