require 'rails_helper'

RSpec.feature "Users", type: :feature do
  background do
     @user_1 = FactoryBot.create(:user)
     @user_2 = FactoryBot.create(:admin_user)

    FactoryBot.create(:flight, user: @user_2)
    FactoryBot.create(:second_flight, user: @user_2)
    FactoryBot.create(:third_flight, user: @user_2)
  end

   def login_as_yohei
    visit user_session_path
    fill_in "user[email]", with: "yyy@yyy.com"
    fill_in "user[password]", with: "password"
    click_button "Log in"
  end

  scenario "ユーザー一覧のテスト" do
    login_as_yohei
    visit users_path

  	expect(page).to have_content 'ユーザー一覧'
  end

  scenario "フライト一覧のテスト" do
    login_as_yohei
    visit flights_path

  	expect(page).to have_content 'Factoryで作ったデフォルトの航空会社'
  end


end
