class Note < ApplicationRecord
    belongs_to :user
    belongs_to :book

    validates :page_number
    validates :summary

    #create Validations
end
