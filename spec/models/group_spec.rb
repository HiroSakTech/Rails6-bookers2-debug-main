# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Groupモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { group.valid? }

    let(:user) { create(:user) }
    let!(:group) { build(:group, owner_id: user.id) }

    context 'titleカラム' do
      it '空欄でないこと' do
        group.name = ''
        is_expected.to eq false
      end
    end

    context 'introductionカラム' do
      it '空欄でないこと' do
        group.introduction = ''
        is_expected.to eq false
      end
      it '200文字以下であること: 200文字は〇' do
        group.introduction = Faker::Lorem.characters(number: 200)
        is_expected.to eq true
      end
      it '200文字以下であること: 201文字は×' do
        group.introduction = Faker::Lorem.characters(number: 201)
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'Group has many Users' do
        expect(Group.reflect_on_association(:users).macro).to eq :has_many
      end
    end
  end
end
