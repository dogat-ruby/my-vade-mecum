require 'rails_helper'

RSpec.describe "books/new", :type => :view do
  before(:each) do
    assign(:book, Book.new(
      :bk_title => "MyString",
      :bk_isbn => 1,
      :bk_author => "MyString"
    ))
  end

  it "renders new book form" do
    render

    assert_select "form[action=?][method=?]", books_path, "post" do

      assert_select "input#book_bk_title[name=?]", "book[bk_title]"

      assert_select "input#book_bk_isbn[name=?]", "book[bk_isbn]"

      assert_select "input#book_bk_author[name=?]", "book[bk_author]"
    end
  end
end
