require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'ユーザー新規登録ができる場合' do
      it 'すべての項目が入力されている' do
      expect(@user).to be_valid
      end
    end

   context 'ユーザー新規登録ができない場合' do
     it 'nicknameが空だと登録できない' do
       @user.nickname = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("Nickname can't be blank")
     end
     it 'emailが空だと登録できない' do
       @user.email = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("Email can't be blank")
     end
     it 'passwordが空だと登録できない' do
       @user.password = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("Password can't be blank")
     end
     it 'first_nameが空だと登録できない' do
       @user.first_name = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("First name can't be blank")
     end
     it 'last_nameが空だと登録できない' do
       @user.last_name = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("Last name can't be blank")
     end
     it 'kana_first_nameが空だと登録できない' do
       @user.kana_first_name = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("Kana first name can't be blank")
     end
     it 'kana_last_nameが空だと登録できない' do
       @user.kana_last_name = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("Kana last name can't be blank")
     end
     it 'birthdayが空だと登録できない' do
       @user.birthday = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("Birthday can't be blank")
     end
     it 'passwordが6文字未満では登録できない' do
      @user.password = 'aa000'
      @user.password_confirmation = 'aa000'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
     end
     it "重複したメールアドレスは登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
     end
     it "メールアドレスに@を含まない場合登録できない" do
      @user.email = 'aaagmail.com'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
     end
     it "英字のみのパスワードでは登録できない" do
      @user.password = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
     end
     it "数字のみのパスワードでは登録できない" do
       @user.password = '000000'
       @user.valid?
       expect(@user.errors.full_messages).to include("Password is invalid")
     end
     it '全角文字を含むパスワードでは登録できない' do
       @user.password = 'aaああaa'
       @user.valid?
       expect(@user.errors.full_messages).to include("Password is invalid")
     end
     it 'パスワードと確認用パスワードが不一致だと登録できない' do
       @user.password_confirmation = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
     end
     it '姓（全角）に半角文字が含まれていると登録できない' do
       @user.last_name = 'okkinnはうと'
       @user.valid?
       expect(@user.errors.full_messages).to include("Last name is invalid")
     end
     it '名（全角）に半角文字が含まれていると登録できない' do
       @user.first_name = 'shu洲悟'
       @user.valid?
       expect(@user.errors.full_messages).to include("First name is invalid")
     end
     it '姓（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
       @user.kana_last_name = 'yよ悪0ヨシムラ'
       @user.valid?
       expect(@user.errors.full_messages).to include("Kana last name is invalid")
     end
     it '名（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
       @user.kana_first_name = 'sす洲0シュウゴ'
       @user.valid?
       expect(@user.errors.full_messages).to include("Kana first name is invalid")
     end
   end
  end
end
