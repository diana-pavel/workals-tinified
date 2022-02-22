class UsersController < ApplicationController

skip_before_action :verify_authenticity_token

  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def edit
    @user = current_user
    authorize @user
    @skill = Skill.new
    if current_user.profile.present?
      @profile = current_user.profile
    else
      @profile = Profile.new
      @profile.user = current_user
      @profile.save
    end
  end

  def update
    @user = current_user
    authorize @user
    @user.update(user_params)

    if @user.save
      redirect_to my_profile_path
    else
      render edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:provider, :uid, :first_name, :last_name, :location, :job_title, :company, :bio, profile_attributes: [:github, :twitter, :linkedin, :personal_website, :other])
  end
end
