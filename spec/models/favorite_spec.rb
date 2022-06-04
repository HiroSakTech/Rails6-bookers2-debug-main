# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Favoriteモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    let(:user) { create(:user) }
    let(:book) { create(:book) }
    let!(:past_favorite) { Favorite.create(user_id: user.id, book_id: book.id) }

    it '1ユーザーは1つの本に一度しかいいねできない' do
      favorite = Favorite.create(user_id: user.id, book_id: book.id)
      expect(favorite).not_to be_valid
    end
  end
end
