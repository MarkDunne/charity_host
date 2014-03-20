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

	def statistics
		if !@is_rendering_charity
			@views_per_day = @charity.views_per_day;
			render 'charity/admin/statistics'
		end
	end

	def manage_admins
		if !@is_rendering_charity
			render 'charity/admin/manage_admins'
		end
	end


	def report_animal
		report = report_animal_params
		lostAnimalUser = User.find_by_email("lostanimal@charityhosting.ie")
		content = "<p>Name: " + report[:name] + "</p>"
		content += "<p>Email: " + report[:email] + "</p>"
		content += "<p>Animal Name: " + report[:animal_name] + "</p>"
		content += "<p>Details: " + report[:details] + "</p>"

		post = Post.new(user_id: lostAnimalUser.id, charity_id: @charity.id, title: "Lost Animal", content: content)
	    post.animal_detail = AnimalDetail.create(report)

	    if post.save
	      post.tags.create(tag: "LostAnimal")
	      flash[:notice] = "Report created successfully"
	    else
	      flash[:error] = "Error creating report"
	    end
	    redirect_to charity_path(@charity)
	end

	def create
		if !user_signed_in?
			flash[:error] = "You must be signed in to create a charity"
		else
			@charity = Charity.new(new_charity_params)
			if @charity.save && AdminsCharity.create(user_id: current_user.id, charity_id: @charity.id)
				flash[:notice] = 'Charity created successfully'
			else
				flash[:error] = 'Error while creating charity'
			end
		end
		redirect_to :back
	end

	def add_admin
		if User.exists?(add_user_params)
			user = User.find_by(add_user_params) #email is unique
			if !user.charities.exists?(@charity)
				AdminsCharity.create(user_id: user.id, charity_id: @charity.id)
				flash[:notice] = "Admin added successfully"
			else
				flash[:error] = "Error adding admin"
			end
		else
			details = add_user_params
			details[:charity_id] = @charity.id
			if !CharityInviteOffers.exists?(details)
				CharityInviteOffers.create(details)
			end
			flash[:error] = "Admin offer extended to #{details[:email]}"
		end
		redirect_to charity_path(@charity)
	end

	def check_passcode
		charity = Charity.find_by(check_passcode_params)
		if charity && user_signed_in?
			AdminsCharity.find_or_create_by(user_id: current_user.id, charity_id: charity.id)
			flash[:notice] = "Passcode Successful"
		else
			flash[:error] = "Passcode Failed"
		end
		redirect_to :root
	end

	private

	def check_passcode_params
		params.require(:charity).permit(:passcode)
	end 

	def report_animal_params
		params.require(:animal_detail).permit(:name, :email, :animal_name, :details)
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
