class CharityController < ApplicationController
	def show
		if @is_rendering_charity
			@settings = @charity.settings
			render 'charity/patron/show', layout: @settings.base_template
		else
			render 'charity/admin/show'
		end
	end

	def posts
		if @is_rendering_charity
			render 'charity/patron/posts'
		else
			render 'charity/admin/posts'
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

	def manage_admins
		render 'charity/admin/manage_admins'
	end

	def add_admin
		if User.exists?(add_user_params)
			user = User.where(add_user_params).first #email is unique
			if !user.charities.exists?(@charity)
				CharitiesUsers.create(user_id: user.id, charity_id: @charity.id)
				flash[:notice] = "Admin added successfully"
			else
				flash[:alert] = "Error adding admin"
			end
		else
			details = add_user_params
			details[:charity_id] = @charity.id
			if !CharityInviteOffers.exists?(details)
				CharityInviteOffers.create(details)
			end
			flash[:alert] = "Admin offer extended to #{details[:email]}"
		end
		redirect_to charity_path(@charity)
	end

	private

	def new_charity_params
		params.require(:charity).permit(:name, :domain)
	end 

	def add_user_params
		params.require(:user).permit(:email)
	end 

	def redirect_to_charity
		#disable redirects on charity controller
	end

end
