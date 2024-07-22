class UsersController < ApplicationController
  before_action :authenticate_user!

  def profile
    @user = current_user
  end

  private

  def user_params
    permitted_attrs = [:firstname, :lastname, :avatar,]
    permitted_attrs << :admin if current_user.admin?
    params.require(:user).permit(permitted_attrs)
  end
end
