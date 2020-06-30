class Book < ApplicationRecord
    has_many :notes
    has_many :users, through: :notes
    validate :is_title_case
    validate :is_f_name_upcase
    validate :is_l_name_upcase 
    before_validation :make_title_case
    before_validation :make_first_name_case
    before_validation :make_last_name_case
    
    validates :title, presence: { message: "can't be empty" }
    validates :author_first_name, presence: { message: "can't be empty" }
    validates :author_last_name, presence: { message: "can't be empty" }


    accepts_nested_attributes_for :notes
    scope :alphabetize, -> {order(title: :asc)}

    def self.search(search)
      where('title LIKE ?', "%#{search}%")
    end


  private

  def is_title_case
    if title.split.any?{|w|w[0].upcase != w[0]}
      errors.add(:title, "Title must be in title case")
    end
  end

  def is_f_name_upcase
    if author_first_name.split.any?{|w|w[0].upcase != w[0]}
    errors.add(:author_first_name, "Author's First Name must be uppercase")
    end
  end

  def is_l_name_upcase
    if author_last_name.split.any?{|w|w[0].upcase != w[0]}
    errors.add(:author_last_name, "Author's Last Name must be uppercase")
    end
  end

  def make_last_name_case
    self.author_last_name = self.author_last_name.titlecase
  end

  def make_first_name_case
    self.author_first_name = self.author_first_name.titlecase
  end



  def make_title_case
    self.title = self.title.titlecase
  end
    
end





# class Post < ActiveRecord::Base

#     
#     belongs_to :author
  
