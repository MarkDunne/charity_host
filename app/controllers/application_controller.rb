class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :exception
  helper_method :resource, :resource_name, :devise_mapping
  before_filter :check_if_rendering_charity

  def check_if_rendering_charity
    @is_rendering_charity = false
    @charity = Charity.find_by_domain(request.host)
    if @charity
      if @charity.verified
        @is_rendering_charity = true
        redirect_to_charity
      else
        render 'charity/patron/validate'
      end
    else
      #makes sure the user has access && gets charity
      if user_signed_in?
        @charity = current_user.managed_charities.find_by_id(params[:id])
        @is_admin = true     
      end
    end
  end

  def redirect_to_charity
    #redirects disabled by default
  end

  #for devise forms
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def is_admin?
    @is_admin
  end
end
