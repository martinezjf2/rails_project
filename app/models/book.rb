class Book < ApplicationRecord
    has_many :notes, through: :users
    has_many :notes
    validates :title, presence: true
    validates :author_first_name, presence: true
    validates :author_last_name, presence: true

    accepts_nested_attributes_for :notes
    
end
