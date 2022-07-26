class User < ApplicationRecord
    has_secure_password
    
    has_many :documents
    has_many :routes
    has_many :goals
    has_many :tasks, dependent: :destroy
    has_and_belongs_to_many :steps

    validates :login, presence: true, uniqueness: true
end
