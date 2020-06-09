class Book < ApplicationRecord
    has_many :notes, through: :users
    validates :title, presence: true
    validates :author_first_name, presence: true
    validates :author_last_name, presence: true
    #create Validations

end

# class Note < ApplicationRecord
#     belongs_to :user
#     belongs_to :book
# end

# class Book < ApplicationRecord
#     has_many :notes
#     has_many :notes, through: :books
# end