require 'rails_helper'
RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it "nicknameが空だと登録できない" do
      user = User.new(nickname: "", email: "kkk@gmail.com", password: "one1piece", password_confirmation: "one1piece", firstname1: "荒蒔", lastname1: "健太郎", firstname2: "あらまき", lastname2: "けんたろう")
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
  end
end