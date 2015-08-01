require 'rails_helper'

RSpec.describe "books/new", :type => :view do
  before(:each) do
    assign(:book, Book.new(
      :title => "MyString",
      :isbn => 1,
      :author => "MyString"
    ))
  end

  it "renders new book form" do
    render

    assert_select "form[action=?][method=?]", books_path, "post" do

      assert_select "input#book_title[name=?]", "book[title]"

      assert_select "input#book_isbn[name=?]", "book[isbn]"

      assert_select "input#book_author[name=?]", "book[author]"
    end
  end
end
