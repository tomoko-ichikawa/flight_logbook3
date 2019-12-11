require 'rails_helper'

RSpec.describe Comment, type: :model do
  it "commentが空ならバリデーションが通らない" do
    comment = Comment.new(content: '')
    expect(comment).not_to be_valid
  end
end
