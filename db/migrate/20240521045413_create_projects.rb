class CreateProjects < ActiveRecord::Migration[7.1]
  def change
    create_table :projects do |t|
      t.string :project_name
      t.integer :status
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
