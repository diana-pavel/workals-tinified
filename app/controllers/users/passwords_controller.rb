# frozen_string_literal: true

class Users::PasswordsController < Devise::PasswordsController

  def forgot
    if params[:email].blank?
      return render json: { error: "Email not present" }, status: :bad_request
    end

    user = User.find_by(:email => params[:email])

    if user.present?
      user.generate_password_token!
      UserNotifierMailer.send_email(user).deliver

      render json: { status: "ok" }, status: :ok
    else
      render json: { error: ["Email address not found. Please check and try again."] }, status: :not_found
    end
  end




  # GET /resource/password/new
  # def new
  #   super
  # end

  # POST /resource/password
  # def create
  #   super
  # end

  # GET /resource/password/edit?reset_password_token=abcdef
  # def edit
  #   super
  # end

  # PUT /resource/password
  # def update
  #   super
  # end

  # protected

  # def after_resetting_password_path_for(resource)
  #   super(resource)
  # end

  # The path used after sending reset password instructions
  # def after_sending_reset_password_instructions_path_for(resource_name)
  #   super(resource_name)
  # end
end
