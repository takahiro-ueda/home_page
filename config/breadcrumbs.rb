crumb :root do
  link "Home", root_path
end

# ブログ（全投稿）
crumb :blog do
  link "投稿一覧(全投稿)", posts_path
  parent :root
end

# ブログ（特定ユーザー投稿）
crumb :nickname_blog do
  link "投稿一覧(ユーザー別)", user_path
  parent :root
end

# ブログ（特定ユーザー投稿）
crumb :category_blog do
  link "投稿一覧(カテゴリ別)", post_category_path
  parent :root
end

# ブログ（検索投稿）
crumb :seach_blog do
  link "投稿一覧(検索別)", search_posts_path
  parent :root
end

# ユーザー編集
crumb :edit_user do
  link "ユーザー編集", edit_user_registration_path
  parent :root
end

# 新規登録
crumb :sign_in do
  link "新規登録", new_user_registration_path
  parent :blog
end

# ログイン
crumb :log_in do
  link "ログイン", new_user_session_path
  parent :blog
end

# パスワード
crumb :password do
  link "パスワード", new_user_password_path
  parent :log_in
end

# 新規投稿
crumb :new_blog do
  link "新規投稿", new_post_path
  parent :blog
end

# 投稿詳細
crumb :show_blog do
  link "投稿詳細", post_path
  parent :blog
end

# 投稿編集
crumb :edit_blog do
  link "投稿編集", edit_post_path
  parent :show_blog
end

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).