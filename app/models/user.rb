class User < ApplicationRecord
    has_many :notes
    has_many :books, through: :notes
    has_secure_password

    validates :first_name, presence: { message: "can't be empty" }
    validates :last_name, presence: { message: "can't be empty" }
    validates :email, presence: {  :message => "can't be empty" }, uniqueness: true 
    validates :username, presence: {  :message => "can't be empty" }, uniqueness: true 



    # def self.search(search)
    #     if search
    #         book = Book.find_by(name: search)

end
