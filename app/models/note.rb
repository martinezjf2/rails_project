class Note < ApplicationRecord
    belongs_to :user
    belongs_to :book

    validates :page_number, presence: true
    validates :summary, presence: true

end


def self.last_note
    self.where("id IN (?), self.")
end

# def self.created_before(time)
#     where("created_at < ?", time)
#   end
# end

# def self.talented_seafarers
#     self.where("id IN (?)", self.sailors.pluck(:id) & self.motorboat_operators.pluck(:id))
#   end