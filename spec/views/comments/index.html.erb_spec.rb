require 'rails_helper'

RSpec.describe "comments/index", type: :view do
  before(:each) do
    assign(:comments, [
      Comment.create!(
        :author => "",
        :post => "",
        :body => "Body"
      ),
      Comment.create!(
        :author => "",
        :post => "",
        :body => "Body"
      )
    ])
  end

  it "renders a list of comments" do
    render
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Body".to_s, :count => 2
  end
end
