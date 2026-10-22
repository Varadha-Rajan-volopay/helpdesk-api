class Ticket< ApplicationRecord
    validates :title, presence: true
    validates :description, presence: true

    validates :priority, inclusion: { in: %w[Low Normal High Urgent] }

    validates :status, inclusion: { in: %w[open in_progress resolved] }
end
