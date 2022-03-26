class User < ApplicationRecord
    has_secure_password
    
    has_many :documents
    has_many :goals
    has_many :tasks, dependent: :destroy

    validates :login, presence: true, uniqueness: true
end
