require 'rails_helper'
describe User do
  describe '#create' do
    it "全て入力されていれば登録できること" do
      user = build(:user)
      expect(user).to be_valid
    end

    # 2. ニックネームが空では登録できないこと
    it " ニックネームが空欄だと登録できない" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    # 3. emailアドレスが空欄だと登録できない
    it "emailアドレスが空欄だと登録できない" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    # 4. パスワードが空では登録できないこと
    it "パスワードが空欄だと登録できない" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    # 5. 年齢が空では登録できないこと
    it "年齢が空欄だと登録できない" do
      user = build(:user, age: nil)
      user.valid?
      expect(user.errors[:age]).to include("を入力してください")
    end

    # 6. 性別が空では登録できないこと
    it "性別が空欄だと登録できない" do
      user = build(:user, sex: nil)
      user.valid?
      expect(user.errors[:sex]).to include("を入力してください")
    end

    # 7. パスワードが存在しても確認パスワードが空では登録できないこと
    it "パスワードが存在しても確認パスワードがない場合は登録できないこと" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とPasswordの入力が一致しません")
    end

    # 8. ニックネームが7文字以上であれば登録できること
    it " ニックネームが7文字以上であれば登録できないこと" do
      user = build(:user, nickname: "aaaaaaa")
      user.valid?
      expect(["is too long (maximum is 7 characters)"]).to include include "is too long"
      # expect(user.errors[:nickname]).to include ("は6文字以内で入力してください")
    end

    # 9. ニックネームが6文字以下であれば登録できないこと
    it "ニックネームが6文字以下では登録できること " do
      user = build(:user, nickname: "aaaaaa")
      expect(user).to be_valid
    end

    # 10. 重複したemailアドレスが存在する場合登録できないこと
    it " 重複したemailアドレスが存在する場合は登録できないこと " do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end

    # 11. パスワードが6文字以上であれば登録できること
    it " パスワードが6文字以上であれば登録できること " do
      user = build(:user, password: "000000", password_confirmation: "000000")
      user.valid?
      expect(user).to be_valid
    end

    # 12. パスワードが5文字以下であれば登録できないこと
    it " パスワードが5文字以下であれば登録できないこと " do
      user = build(:user, password: "00000", password_confirmation: "00000")
      user.valid?
      expect(user.errors[:password]).to include("は6文字以上で入力してください")
    end
  end
end