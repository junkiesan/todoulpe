class Task < ApplicationRecord
  # Associations 
  belongs_to :user
  has_many :comments

  # Priority constant
  PRIORITY = ["chill", "work", "hardcore"]
end
