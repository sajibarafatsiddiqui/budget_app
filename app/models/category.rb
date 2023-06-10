class Category < ApplicationRecord
  belongs_to :user
  has_many :categories_deals
  has_many :deals, through: :categories_deals
  has_one_attached :icon

  validates :Name, presence: true

  # attribute :icon_path, :string
  def icon_url(host)
    ActiveStorage::Current.host = host
    icon.url if icon.attached?
  end
end
