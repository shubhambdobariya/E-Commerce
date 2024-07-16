class TicketsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project, only: [:new, :create]

  def index
    @tickets = Ticket.all
  end

  def new
    @ticket = Ticket.new
  end

  def show
    @ticket = Ticket.find(params[:id])
    @developers = @ticket.developers
  end

  def create
    @ticket = @project.tickets.new(ticket_params)
    if @ticket.save
      flash[:success] = "Ticket was successfully created."
      redirect_to @ticket
    else
      flash.now[:error] = "There was an error creating the ticket."
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @ticket = Ticket.find(params[:id])
  end

  def update
    @ticket = Ticket.find(params[:id])
    if @ticket.update(ticket_params)
      flash[:success] = "Ticket was successfully updated."
      redirect_to @ticket
    else
      flash.now[:error] = "There was an error updating the ticket."
      render :edit
    end
  end

  def destroy
    @ticket = Ticket.find(params[:id])
    @ticket.destroy
    flash[:success] = "Ticket was successfully deleted."
    redirect_to tickets_path
  end

  def assign_developer
    developer_id = params[:developer_id]
    ticket_id = params[:ticket_id]
    TicketAssign.find_or_create_by(ticket_id: ticket_id, developer_id: developer_id)
    @ticket = Ticket.find(ticket_id)
    if @ticket.update(status: params[:status])
      flash[:success] = "Developer assigned and ticket status updated successfully."
      redirect_to @ticket
    else
      flash[:error] = "There was an error assigning developer or updating ticket status."
      redirect_to @ticket
    end
  end

  private

  def ticket_params
    params.require(:ticket).permit(:title, :description, :status, :developer_id, :project_id)
  end

  def set_project
    @project = Project.find_by(id: params[:project_id]) if params[:project_id].present?
  end
  
end
