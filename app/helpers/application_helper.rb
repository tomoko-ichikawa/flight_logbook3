module ApplicationHelper
  def login_helper style
    if user_signed_in?
      # (link_to "新規投稿", new_flight_path) +
      (link_to "ログアウト", destroy_user_session_path, method: :delete, class: style) +
      "&emsp;".html_safe +
      (link_to "マイページ", user_path(current_user.id), class: style) 
      # (link_to "マイページ編集", edit_user_registration_path, class: style)
    else
      (link_to "新規登録", new_user_registration_path, class: style) +
      "&emsp;".html_safe +
      (link_to "ログイン", new_user_session_path, class: style)
    end
  end
end
