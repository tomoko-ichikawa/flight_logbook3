require 'rails_helper'

RSpec.describe User, type: :model do
  it '名前、メールアドレス、パスワードが指定の入力値であれば、invalidしないかどうか' do
    user = User.new(
      name:"testマン",
      email:"test@gmail.com",
      password:"testtest"
      )
    expect(user).to be_valid
  end 

  it "名前に入力がなければエラーメッセージが出るかどうか" do
    user = User.new(name: nil)
    user.valid?
    expect(user.errors[:name]).to include("を入力してください")
  end
end