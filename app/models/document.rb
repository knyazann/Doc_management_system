class Document < ApplicationRecord
    belongs_to :user
    has_many :routes, dependent: :destroy
    #has_many :users, through: :routes
    has_one_attached :file     

    def self.search(search_number, search_name, search_type, search_contractor)
        if search_contractor == ""
            self.where("number LIKE ? and name LIKE ? and doc_type LIKE ?", "%#{search_number}%", "%#{search_name}%", "%#{search_type}%")
        else
            self.where("number LIKE ? and name LIKE ? and doc_type LIKE ? and contractor_id::text LIKE ?", "%#{search_number}%", "%#{search_name}%","%#{search_type}%", "%#{search_contractor}%")
        end
    end
end
