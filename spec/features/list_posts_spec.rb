require 'rails_helper'

RSpec.describe 'List Posts', type: :feature do
  let(:post) { posts(:first_post) }
  let(:user) { users(:james) }

  describe 'when logged out' do
    it 'requires login' do
      visit '/'
      expect(page.current_path).to eq '/users/sign_in'
    end
  end

  describe 'when logged in' do
    before do
      sign_in(user)
    end
    it 'shows posts' do
      visit '/'
      expect(page).to have_content('First Post')
    end

    it 'shows posts in reverse chronology' do
      Post.create(author: users(:mary), title: 'Second Post', body: 'a body', publish_date: 2.hours.from_now)
      visit '/'
      expect(page.find('.post:nth-child(1)')).to have_content 'Second Post'
      expect(page.find('.post:nth-child(2)')).to have_content 'First Post'
    end
  end
end