class Document < ApplicationRecord
    belongs_to :user
    has_many :routes
    has_many :users, through: :routes
    has_one_attached :file     
end
