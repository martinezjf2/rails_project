class User < ApplicationRecord
    has_many :notes
    has_many :notes, through: :books
    has_secure_password

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true, uniqueness: true
    validates :username, presence: true, uniqueness: true 

end
