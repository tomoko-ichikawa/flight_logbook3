require 'rails_helper'

RSpec.feature "フライト管理機能", type: :feature do
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

  scenario "フライト一覧のテスト" do
    login_as_yohei
    visit flights_path

  	expect(page).to have_content 'Factoryで作ったデフォルトの航空会社'
  end

  scenario "フライト作成のテスト" do
    login_as_yohei
    visit new_flight_path
    # binding.pry
    fill_in "flight[airline]", with: "airline"
    click_button "登録する" #投稿入力画面のsubmitボタン

    visit confirm_flights_path
    click_button "投稿する" #確認画面のSubmit

    # save_and_open_page

    expect(page).to have_content 'Factoryで作ったデフォルトの航空会社'
  end

  scenario "フライト詳細のテスト" do
    login_as_yohei
    visit flights_path
    all('td')[8].click_link
    expect(page).to have_content 'Aクラス'

    visit flights_path
    all('td')[19].click_link
    expect(page).to have_content 'Bクラス'

# /html/body/table/tbody/tr[2]/td[9]
# 検証画面からXpathをコピーしたもの

# save_and_open_page
  end
end