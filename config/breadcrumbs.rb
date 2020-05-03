crumb :root do
  link "Home", root_path
end

# ブログ
crumb :blog do
  link "ブログ一覧", posts_path
  parent :root
end

# 新規登録
crumb :sign_in do
  link "新規登録", new_post_path
  parent :blog
end

# ログイン
crumb :log_in do
  link "ログイン", new_user_session_path
  parent :blog
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