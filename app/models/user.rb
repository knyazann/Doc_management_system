class User < ApplicationRecord
    has_secure_password
    
    has_many :goals

    validates :login, presence: true, uniqueness: true
end
