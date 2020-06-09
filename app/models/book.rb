class Book < ApplicationRecord
    has_many :notes, through: :users
    validates :title, presence: true
    validates :author_first_name, presence: true
    validates :author_last_name, presence: true
    
end
