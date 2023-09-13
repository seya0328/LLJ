class Tag < ApplicationRecord
  has_many :post_tag
  has_many :posts, through: :post_tag, dependent: :destroy
  
  validates :name, uniqueness: true, dependent: :destroy
end
