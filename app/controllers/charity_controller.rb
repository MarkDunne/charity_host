class CharityController < ApplicationController
	def show
		if !@is_rendering_charity
			#make sure the user has access
			@charity = current_user.charities.find(params[:id])

			render 'charity/admin_show'
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
