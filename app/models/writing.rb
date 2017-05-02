class Writing < ApplicationRecord
  validates :content, presence: true
  belongs_to :user
  belongs_to :composition
  has_many :corrections

  scope :recent, -> { order("created_at DESC")}

end
