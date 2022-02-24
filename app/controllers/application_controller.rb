class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :authenticate_user!
  include Pundit

  # Pundit: white-list approach.
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  # Uncomment when you *really understand* Pundit!
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(root_path)
  end

  helper_method :resource_name, :resource, :devise_mapping, :resource_class
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  #def after_sign_in_path_for(resource_or_scope)
    #if resource.sign_in_count == 1
      #edit_user_path(current_user)
    #else
      #my_profile_path
    #end
  #end

  def resource_class
    User
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  protected

  def configure_permitted_parameters
    added_attrs = [:uid, :provider, :client_id, :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :location, :work_status, :company, :job_title, :bio, :picture, :role, uploads: []]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
