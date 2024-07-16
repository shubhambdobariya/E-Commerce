class TicketAssign < ApplicationRecord
  belongs_to :developer
  belongs_to :ticket
end
