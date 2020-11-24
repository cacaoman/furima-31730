require 'rails_helper'

RSpec.describe User, type: :model do
  describe User do
    before do
      @user = FactoryBot.build(:user)
    end

    describe 'ユーザー新規登録' do
      context '新規登録がうまく行くとき' do
        it "nickname, email, password, encrypted_password, family_name, first_name, family_name_kana, first_name_kana, date_of_birthが存在すれば登録できること" do
          expect(@user).to be_valid
        end
      end
      
      context '新規登録がうまくいかないとき' do
        it "nicknameが空だと登録できない" do
          @user.nickname = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end
        it "emailが空では登録できない" do
          @user.email = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end
        it "passwordが空では登録できない" do
          @user.password = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end
        it "family_nameが空では登録できない" do
          @user.family_name = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Family name can't be blank")
        end
        it "first_nameが空では登録できない" do
          @user.first_name = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("First name can't be blank")
        end
        it "family_name_kanaが空では登録できない" do
          @user.family_name_kana = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Family name kana can't be blank")
        end
        it "first_name_kanaが空では登録できない" do
          @user.first_name_kana = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana can't be blank")
        end
        it "date_of_birthが空では登録できない" do
          @user.date_of_birth = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Date of birth can't be blank")
        end
        it "重複したemailが存在する場合登録できない" do
          @user.save
          another_user = FactoryBot.build(:user)
          another_user.email = @user.email
          another_user.valid?
          expect(another_user.errors.full_messages).to include("Email has already been taken")
        end
        it "emailは@を含まないと登録できない" do
          @user.email = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end
        it "ユーザー本名は、全角(漢字、ひらがな、カタカナ)での入力が必須でないと登録できない" do
          @user.family_name = /\A[ぁ-んァ-ン一-龥]/
          @user.valid?
          expect(@user.errors.full_messages).to include("Family name is invalid") 
        end
        it "ユーザー本名のフリガナは、全角(カタカナ)での入力が必須でないと登録できない" do
          @user.family_name_kana = /\A[ァ-ヶー－]+\z/
          @user.valid?
          expect(@user.errors.full_messages).to include("Family name kana is invalid")
        end
        it "パスワードとパスワード(確認)が一致していないと登録できない" do
          @user.password = "111111"
          @user.password_confirmation = "1111110"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
        it "passwordが5文字以下ではあれば登録できない" do
          @user.password = "12345"
          @user.password_confirmation = "12345"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
        end
      end
    end
  end
end
