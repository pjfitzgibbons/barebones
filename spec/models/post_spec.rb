require 'rails_helper'

RSpec.describe Post, type: :model do
  fixtures :users, :posts, :comments

  let(:comment) { comments(:first_comment) }
  let(:post) { posts(:first_post) }
  let(:mary) { users(:mary) }
  let(:james) { users(:james) }

  describe 'relations' do
    it 'belongs to author' do
      expect(post.author).to eq james
    end
    it 'has many comments' do
      expect(post.comments).to match_array([comment])
    end
  end

  describe 'validations' do
    let(:post) { Post.new(author: mary, title: 'title', body: 'a body') }

    it 'requires body' do
      post.body = nil
      expect(post).not_to be_valid
      expect(post.errors.full_messages).to include "Body can't be blank"
    end
    it 'requires title' do
      post.title = nil
      expect(post).not_to be_valid
      expect(post.errors.full_messages).to include "Title can't be blank"
    end
    it 'requires author' do
      post.author = nil
      expect(post).not_to be_valid
      expect(post.errors.full_messages).to include "Author can't be blank"
    end
  end

end
