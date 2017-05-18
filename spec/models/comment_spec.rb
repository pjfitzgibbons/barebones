require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:comment) { comments(:first_comment) }
  let(:post) { posts(:first_post) }
  let(:mary) { users(:mary) }

  describe 'relations' do
    it 'belongs to post' do
      expect(comment.post).to eq post
    end

    it 'belongs to author' do
      expect(comment.author).to eq mary
    end
  end

  describe 'validations' do
    let(:comment) { Comment.new(author: mary, post: post, body: 'a body') }

    it 'requires body' do
      comment.body = nil
      expect(comment).not_to be_valid
      expect(comment.errors.full_messages).to include "Body can't be blank"
    end
    it 'requires author' do
      comment.author = nil
      expect(comment).not_to be_valid
      expect(comment.errors.full_messages).to include "Author can't be blank"
    end
    it 'requires body' do
      comment.post = nil
      expect(comment).not_to be_valid
      expect(comment.errors.full_messages).to include "Post can't be blank"
    end
  end
end
