class Book < ApplicationRecord
    has_many :notes, through: :users
end

# class Note < ApplicationRecord
#     belongs_to :user
#     belongs_to :book
# end

# class Book < ApplicationRecord
#     has_many :notes
#     has_many :notes, through: :books
# end