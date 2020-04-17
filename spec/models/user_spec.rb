require 'rails_helper'

describe User do
  describe '#create' do
    context "新規登録できる場合" do
      it "nickname,email,password,password_confirmationがある場合は登録できる" do
        user = build(:user)
        expect(user).to be_valid
      end

      it "nicknameが8文字以下なら登録できる" do
        user = build(:user, nickname: "abcdefgh")
        expect(user).to be_valid
      end

      it "passwordが6文字以上なら登録できる" do
        user = build(:user, password: "000000")
        expect(user).to be_valid
      end
    end

    context "新規登録できない場合" do
      it "nicknameがない場合は登録できない" do
        user = build(:user, nickname: "")
        user.valid?
        expect(user.errors[:nickname]).to include("can't be blank")
      end

      it "nicknameが9文字以上だと登録できない" do
        user = build(:user, nickname: "abcdefghi")
        user.valid?
        expect(user.errors[:nickname]).to include("8文字以下入力してください")
      end

      it "emailがない場合は登録できない" do
        user = build(:user, email: "")
        user.valid?
        expect(user.errors[:email]).to include("can't be blank")
      end

      it "passwordがない場合は登録できない" do
        user = build(:user, password: "")
        user.valid?
        expect(user.errors[:password]).to include("can't be blank")
      end

      it "passwordが存在してもpassword_confirmationがない場合は登録できない" do
        user = build(:user, password_confirmation: "")
        user.valid?
        expect(user.errors[:password_confirmation]).to include("doesn't match Password")
      end

      it "重複したemailが存在する場合登録できない" do
        user = create(:user)
        another_user = build(:user)
        another_user.valid?
        expect(another_user.errors[:email]).to include("has already been taken")
      end

      it "passwordが5文字以下なら登録できない" do
        user = build(:user, password: "00000")
        user.valid?
        expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
      end
    end
  end
end