class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.paginate(page: params[:page], per_page: 10)
  end

  def profile
    @user = current_user
  end

  private

  def user_params
    params.require(:user).permit(project_ids: [])
  end
end
