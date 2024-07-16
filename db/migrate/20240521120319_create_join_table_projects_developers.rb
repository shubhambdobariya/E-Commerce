class CreateJoinTableProjectsDevelopers < ActiveRecord::Migration[7.1]
  def change
    create_join_table :projects, :developers do |t|
      t.index :project_id
      t.index :developer_id
    end
  end
end
