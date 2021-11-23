require 'rails_helper'

RSpec.describe User, type: :model do
  describe "ユーザー新規登録" do
    it "nicknameが空だと登録できない" do
      user = User.new(nickname: "", email: "aaa@gmail.com", password: "aaaaaa", first_name: "太郎", last_name: "山田", kana_first_name: "タロウ", kana_last_name: "ヤマダ", birthday: "20030410")
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空だと登録できない" do
      user = User.new(nickname: "shugo", email: "", password: "aaaaaa", first_name: "太郎", last_name: "山田", kana_first_name: "タロウ", kana_last_name: "ヤマダ", birthday: "20030410")
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it "passwordが空だと登録できない" do
      user = User.new(nickname: "shugo", email: "aaa@gmail.com", password: "", first_name: "太郎", last_name: "山田", kana_first_name: "タロウ", kana_last_name: "ヤマダ", birthday: "20030410")
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end
    it "first_nameが空だと登録できない" do
      user = User.new(nickname: "shugo", email: "aaa@gmail.com", password: "aaaaaa", first_name: "", last_name: "山田", kana_first_name: "タロウ", kana_last_name: "ヤマダ", birthday: "20030410")
      user.valid?
      expect(user.errors.full_messages).to include("First_name can't be blank")
    end
    it "last_nameが空だと登録できない" do
      user = User.new(nickname: "shugo", email: "aaa@gmail.com", password: "aaaaaa", first_name: "太郎", last_name: "", kana_first_name: "タロウ", kana_last_name: "ヤマダ", birthday: "20030410")
      user.valid?
      expect(user.errors.full_messages).to include("Last_name can't be blank")
    end
    it "kana_first_nameが空だと登録できない" do
      user = User.new(nickname: "shugo", email: "aaa@gmail.com", password: "aaaaaa", first_name: "太郎", last_name: "山田", kana_first_name: "", kana_last_name: "ヤマダ", birthday: "20030410")
      user.valid?
      expect(user.errors.full_messages).to include("Kana_first_name can't be blank")
    end
    it "kana_last_nameが空だと登録できない" do
      user = User.new(nickname: "shugo", email: "aaa@gmail.com", password: "aaaaaa", first_name: "太郎", last_name: "山田", kana_first_name: "タロウ", kana_last_name: "", birthday: "20030410")
      user.valid?
      expect(user.errors.full_messages).to include("Kana_last_name can't be blank")
    end
    it "birthdayが空だと登録できない" do
      user = User.new(nickname: "shugo", email: "aaa@gmail.com", password: "aaaaaa", first_name: "太郎", last_name: "山田", kana_first_name: "タロウ", kana_last_name: "ヤマダ", birthday: "")
      user.valid?
      expect(user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
