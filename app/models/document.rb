class Document < ApplicationRecord
    belongs_to :user
    has_many :routes, dependent: :destroy
    #has_many :users, through: :routes
    has_one_attached :file     

    def self.search(search_from, search_to)
        self.where("from_place LIKE ? and to_place LIKE ?", "%#{search_from}%", "%#{search_to}%")
    end
end
