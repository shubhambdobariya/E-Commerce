class DevelopersController < ApplicationController
  before_action :authenticate_user!

  def index
    p 111111111111111111
    @developers = Rails.cache.fetch("ECOMMERCE_DEVELOPERS", expires_in: 1.minutes) do
      p 44444444444444444444
      Developer.includes(:projects).all.paginate(page: params[:page], per_page: 10)
    end
  end

  def show
    @developer = Developer.find(params[:id])
  end

  def new
    @developer = Developer.new
  end

  def create
    @developer = current_user.developers.new(developer_params)

    if @developer.save
      UserMailer.welcome_email(current_user, @developer).deliver_now

      flash[:success] = 'Developer was successfully created.'
      redirect_to @developer
    else
      flash.now[:error] = @developer.errors.full_messages.to_sentence
      render :new, status: :unprocessable_entity
    end
  end 

  def edit
    @developer = Developer.find(params[:id])
  end

  def update
    @developer = Developer.find(params[:id])
  
    if @developer.update(developer_params)
      SendWelcomeEmailWorker.perform_async(current_user.id, @developer.id)
  
      flash[:success] = 'Developer was successfully updated.'
      redirect_to @developer
    else
      flash.now[:error] = 'There was an error updating the developer.'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @developer = Developer.find(params[:id])
    @developer.destroy

    flash[:success] = 'Developer was successfully deleted.'
    redirect_to developers_path
  end

  private

  def developer_params
    params.require(:developer).permit(:name, :position, project_ids: [])
  end
end
