# frozen_string_literal: true

class Book < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 200 }

  scope :exact_match, ->(word) { where('title LIKE ?', word.to_s) }
  scope :forward_match, ->(word) { where('title LIKE ?', "#{word}%") }
  scope :backward_match, ->(word) { where('title LIKE ?', "%#{word}") }
  scope :partial_match, ->(word) { where('title LIKE ?', "%#{word}%") }

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
end
