# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  has_many :followers, class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy,
                       inverse_of: :follower
  has_many :followed, class_name: 'Relationship', foreign_key: 'followed_id', dependent: :destroy, inverse_of: :followed
  has_many :group_users, dependent: :destroy
  has_many :groups, through: :group_users

  has_one_attached :profile_image

  validates :name, length: { minimum: 2, maximum: 20 }, uniqueness: true
  validates :introduction, length: { maximum: 50 }

  scope :exact_match, ->(word) { where('name LIKE ?', word.to_s) }
  scope :forward_match, ->(word) { where('name LIKE ?', "#{word}%") }
  scope :backward_match, ->(word) { where('name LIKE ?', "%#{word}") }
  scope :partial_match, ->(word) { where('name LIKE ?', "%#{word}%") }

  def get_profile_image(width = 100, height = 100)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'no_image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end

  def self.guest
    find_or_create_by!(name: 'guestuser', email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = 'guestuser'
    end
  end
end
