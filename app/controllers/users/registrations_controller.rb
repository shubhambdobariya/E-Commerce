class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_user, only: [:edit, :update]

  # GET /resource/edit
  def edit
    super
  end

  # PUT /resource
  def update
    if @user.update(user_params)
      if params[:avatar].present?
        @user.avatar.attach(params[:avatar])
      end
      redirect_to edit_user_registration_path, notice: 'Profile updated successfully.'
    else
      render :edit
    end
  end

  protected

  # Configure permitted parameters for sign up and account update
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:firstname, :lastname, :avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: [:firstname, :lastname, :avatar])
  end

  private

  # Set user for edit and update actions
  def set_user
    @user = current_user
  end

  # Strong parameters for user attributes
  def user_params
    permitted_attrs = [:firstname, :lastname, :avatar]
    permitted_attrs << :admin if current_user.admin?
    params.require(:user).permit(permitted_attrs)
  end
end
