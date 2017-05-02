class Correction < ApplicationRecord

  belongs_to :user
  belongs_to :writing

  scope :recent, -> { order("created_at DESC")}
end
