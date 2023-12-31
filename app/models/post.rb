class Post < ApplicationRecord
  
  has_one_attached :image
  acts_as_taggable_on :tags
  belongs_to :user
  belongs_to :child
  has_many :post_comments, dependent: :destroy
  #has_many :post_tags
  #has_many :tags, through: :post_tags
  has_many :favorites, dependent: :destroy
  
  def get_profile_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_fit: [width, height]).processed
  end
  
  def self.search(keyword)
    where("title LIKE ?", "%#{keyword}%")
  end
  
  def self.tag_search(tag)
    where("title LIKE ?", "%#{keyword}%")
  end
  
   def favorited_by?(user)
    favorites.exists?(user_id: user.id)
   end
  
end
