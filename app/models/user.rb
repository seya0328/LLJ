class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :image
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :last_name, :first_name, length: {minimum: 2, maximum: 20}, uniqueness: true
  has_many :children, dependent: :destroy       
  has_many :posts, dependent: :destroy
  has_many :post_comments, dependent: :destroy
end
