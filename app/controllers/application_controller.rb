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
      @is_rendering_charity = true
    else
      #makes sure the user has access && gets charity
      @charity = current_user.charities.find(params[:id])
    end
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
end
