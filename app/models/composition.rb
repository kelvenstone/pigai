class Composition < ApplicationRecord
  belongs_to :user
  has_many :images
  has_many :writings
  validates :grade, presence: true
  validates :com_title, presence: true
  validates :content, presence: true

  scope :recent, -> { order("created_at DESC")}

end
