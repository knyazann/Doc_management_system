class Route < ApplicationRecord
  belongs_to :user
  belongs_to :document
  has_many :steps, dependent: :destroy
end
