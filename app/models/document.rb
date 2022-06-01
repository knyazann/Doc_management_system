class Document < ApplicationRecord
    belongs_to :user
    belongs_to :contractor
    has_many :routes, dependent: :destroy
    #has_many :users, through: :routes
    has_one_attached :file     
end
