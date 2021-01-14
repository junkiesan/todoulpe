class Task < ApplicationRecord
  # Associations 
  belongs_to :user
  has_many :comments, dependent: :destroy

  # Scopes
  scope :todo, -> { where(status: false).order(id: :desc) }
  scope :completed, -> { where(status: true).order(id: :desc) }

  # Validations
  validates :priority, inclusion: { in: ["chill", "work", "hardcore"] }
  validates :title, presence: true
  validates :title, length: { in: 3..30,
    too_long: "30 characters is the maximum allowed"}
  validate :check_expiracy

  # Send error if deadline expired
  def check_expiracy
    errors.add(:deadline, "the deadline is here") if self.deadline.expired?
  end

  # Checking if deadline is not expired
  def expired?
    self.deadline > Date.today ? priority == "hardcore" : priority
  end
end
