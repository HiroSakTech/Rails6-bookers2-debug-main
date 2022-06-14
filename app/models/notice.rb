# frozen_string_literal: true

class Notice < ApplicationRecord
  belongs_to :group

  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 1000 }
end
