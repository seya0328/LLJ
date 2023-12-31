class Child < ApplicationRecord
  belongs_to :user
  has_many :posts
  has_one_attached :profile_image
  # validates :title, presence: true
  enum gender: { male: 0, female: 1 }
  
  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end
  
  
end
