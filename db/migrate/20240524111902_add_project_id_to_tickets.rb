class AddProjectIdToTickets < ActiveRecord::Migration[7.1]
  def change
    add_column :tickets, :project_id, :integer
  end
end
