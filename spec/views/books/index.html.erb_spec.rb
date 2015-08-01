require 'rails_helper'

RSpec.describe "books/index", :type => :view do
  before(:each) do
    assign(:books, [
      Book.create!(
        :title => "Bk Title",
        :isbn => 1,
        :author => "Bk Author"
      ),
      Book.create!(
        :title => "Bk Title",
        :isbn => 1,
        :author => "Bk Author"
      )
    ])
  end

  it "renders a list of books" do
    render
    assert_select "tr>td", :text => "Bk Title".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Bk Author".to_s, :count => 2
  end
end
