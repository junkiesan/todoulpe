class Comment < ApplicationRecord
  # Associations
  belongs_to :task

  # Validations
  validates :details, presence: true
  validates :details, length: { maximum: 500 }

  # Scope
  default_scope { order(created_at: :desc) }

end
