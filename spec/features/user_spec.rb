require 'rails_helper'

RSpec.feature "Users", type: :feature do
  # background do
  #    @user_1 = FactoryBot.create(:user)
  #    @user_2 = FactoryBot.create(:admin_user)

  #   FactoryBot.create(:flight, user: @user_2)
  #   FactoryBot.create(:second_flight, user: @user_2)
  #   FactoryBot.create(:third_flight, user: @user_2)
  # end

   def login_as_yohei
    visit user_session_path
    fill_in "user[email]", with: "yyy@yyy.com"
    fill_in "user[password]", with: "password"
    click_button "Log in"
  end

  scenario "新規登録が完了すると、ユーザー一覧画面に追加されること" do
  	visit new_user_registration_path
    fill_in "user[name]", with: "yohei"
    fill_in "user[email]", with: "yyy@yyy.com"
    fill_in "user[password]", with: "password"
    fill_in "user[password_confirmation]", with: "password"
    click_button "Sign up"

    visit users_path

    expect(page).to have_content 'yohei'
  end

  scenario "ログインが完了すると、投稿一覧画面に遷移すること" do
    login_as_yohei
    visit flights_path

  	expect(page).to have_content '投稿一覧'
  end
end
