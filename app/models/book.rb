class Book < ApplicationRecord
    has_many :notes
    has_many :users, through: :notes
    validate :is_title_case 
    before_validation :make_title_case 
    
    validates :title, presence: { message: "can't be empty" }
    validates :author_first_name, presence: { message: "can't be empty" }
    validates :author_last_name, presence: { message: "can't be empty" }


    accepts_nested_attributes_for :notes
    scope :alphabetize, -> {order(title: :asc)}

    


  private

  def is_title_case
    if title.split.any?{|w|w[0].upcase != w[0]}
      errors.add(:title, "Title must be in title case")
    end
  end

  def make_title_case
    self.title = self.title.titlecase
  end
    
end





# class Post < ActiveRecord::Base

#     
#     belongs_to :author
  
