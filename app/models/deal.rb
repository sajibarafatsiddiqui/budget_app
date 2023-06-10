# frozen_string_literal: true

class Deal < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :categories_deals
  has_many :categories, through: :categories_deals

  validates :name, presence: true
  validates :amount, numericality: { greater_than_or_equal_to: 0 }
end
