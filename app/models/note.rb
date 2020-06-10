class Note < ApplicationRecord
    belongs_to :user
    belongs_to :book

    validates :page_number, presence: true
    validates :summary, presence: true

end
