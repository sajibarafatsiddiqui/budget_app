class Deal < ApplicationRecord
  belongs_to :author, :class_name=> 'User'
  has_many :categories_deals
  has_many :categories, through: :categories_deals
  
end
