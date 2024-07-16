class CreateTicketAssigns < ActiveRecord::Migration[7.1]
  def change
    create_table :ticket_assigns do |t|
      t.references :developer, null: false, foreign_key: true
      t.references :ticket, null: false, foreign_key: true

      t.timestamps
    end
  end
end
