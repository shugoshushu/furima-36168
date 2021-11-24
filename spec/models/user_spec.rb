require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    it "nicknameが空だと登録できない" do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it "emailが空だと登録できない" do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it "passwordが空だと登録できない" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end
    it "first_nameが空だと登録できない" do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First_name can't be blank"
    end
    it "last_nameが空だと登録できない" do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last_name can't be blank"
    end
    it "kana_first_nameが空だと登録できない" do
      @user.kana_first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Kana_first_name can't be blank"
    end
    it "kana_last_nameが空だと登録できない" do
      @user.kana_last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Kana_last_name can't be blank"
    end
    it "birthdayが空だと登録できない" do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Birthday can't be blank"
    end
  end
end
