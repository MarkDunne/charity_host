class CharityController < ApplicationController

	before_filter :choose_layout

	def show
		if @is_rendering_charity
			render 'charity/patron/show'
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

	def about
		if @is_rendering_charity
			render 'charity/patron/about'
		end
	end

	def login
		if @is_rendering_charity
			render 'charity/patron/login'
		end
	end

	def create
		if !user_signed_in?
			flash[:alert] = "You must be signed in to create a charity"
		else
			@charity = Charity.new(new_charity_params)
			if @charity.save && AdminsCharity.create(user_id: current_user.id, charity_id: @charity.id)
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
			user = User.find_by(add_user_params) #email is unique
			if !user.charities.exists?(@charity)
				AdminsCharity.create(user_id: user.id, charity_id: @charity.id)
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

	def check_passcode
		charity = Charity.find_by(check_passcode_params)
		if charity && user_signed_in?
			AdminsCharity.find_or_create_by(user_id: current_user.id, charity_id: charity.id)
			flash[:notice] = "Passcode Successful"
		else
			flash[:alert] = "Passcode Failed"
		end
		redirect_to :root
	end

	private

	def check_passcode_params
		params.require(:charity).permit(:passcode)
	end 

	def new_charity_params
		params.require(:charity).permit(:name, :domain)
	end 

	def add_user_params
		params.require(:user).permit(:email)
	end 

	def choose_layout
		if @is_rendering_charity
			@settings = @charity.settings
			self.class.layout 'patron'
		else
			self.class.layout 'admin'
		end
	end
end
