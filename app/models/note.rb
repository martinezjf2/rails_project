class Note < ApplicationRecord
    belongs_to :user
    belongs_to :book

    #create Validations
end
