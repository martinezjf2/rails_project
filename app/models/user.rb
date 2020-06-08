class User < ApplicationRecord
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true, uniqueness: true
    validates :username, presence: true, uniqueness: true 
    validates :password, presence: true, length: { in: 6..20 }
    has_secure_password
    # Do validations for each model

    has_many :notes
    has_many :notes, through: :books

    # Also, do the relationships 
    #     -has_many :notes
    #     -belongs_to :user
    #     -has_many :notes, through: :users
end
