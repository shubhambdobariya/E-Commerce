# app/controllers/projects_controller.rb
class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project, only: [:show, :edit, :update, :destroy, :check_tickets]
  before_action :authorize_project, only: [:show, :edit, :update, :destroy, :check_tickets]

  def index
    @projects = policy_scope(Project.includes(:developers)).paginate(page: params[:page], per_page: 10)
  end

  def new
    @project = Project.new
    authorize @project
  end

  def show
    authorize @project
  end

  def create
    @project = Project.new(project_params)
    authorize @project
    if @project.save
      flash[:success] = "Project was successfully created."
      redirect_to @project
    else
      flash.now[:error] = "There was an error creating the project."
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @project
  end

  def update
    authorize @project
    if @project.update(project_params)
      flash[:success] = "Project was successfully updated."
      redirect_to @project
    else
      flash.now[:error] = "There was an error updating the project."
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @project
    @project.destroy
    flash[:success] = "Project was successfully deleted."
    redirect_to projects_path
  end

  def check_tickets
    authorize @project
    @tickets = @project.tickets
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def authorize_project
    authorize @project
  end

  def project_params
    params.require(:project).permit(:project_name, :status, :start_date, :end_date, developer_ids: [])
  end
end