require 'rails_helper'
describe Post do
  describe '#create' do
    # 1. タイトルが空では登録できないこと
    it "タイトルが空欄だと登録できない" do
      post = build(:post, title: nil)
      post.valid?
      expect(post.errors[:title]).to include("を入力してください")
    end

    # 2. 投稿フォームが空では登録できないこと
    it "投稿フォームが空欄だと登録できない" do
      post = build(:post, content: nil)
      post.valid?
      expect(post.errors[:content]).to include("を入力してください")
    end

    # 3. カテゴリが空では登録できないこと
    it "カテゴリが空欄だと登録できない" do
      post = build(:post, category_id: nil)
      post.valid?
      expect(post.errors[:category_id]).to include("を入力してください")
    end

  end
end