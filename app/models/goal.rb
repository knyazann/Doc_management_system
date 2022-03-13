class Goal < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy
  has_many :users, through: :tasks
  has_one_attached :file  

  validates :topic, presence: true
end
