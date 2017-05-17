require 'rails_helper'

RSpec.describe "comments/edit", type: :view do
  before(:each) do
    @comment = assign(:comment, Comment.create!(
      :author => "",
      :post => "",
      :body => "MyString"
    ))
  end

  it "renders the edit comment form" do
    render

    assert_select "form[action=?][method=?]", comment_path(@comment), "post" do

      assert_select "input#comment_author[name=?]", "comment[author]"

      assert_select "input#comment_post[name=?]", "comment[post]"

      assert_select "input#comment_body[name=?]", "comment[body]"
    end
  end
end
