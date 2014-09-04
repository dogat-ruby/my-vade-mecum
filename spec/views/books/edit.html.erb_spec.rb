require 'rails_helper'

RSpec.describe "books/edit", :type => :view do
  before(:each) do
    @book = assign(:book, Book.create!(
      :bk_title => "MyString",
      :bk_isbn => 1,
      :bk_author => "MyString"
    ))
  end

  it "renders the edit book form" do
    render

    assert_select "form[action=?][method=?]", book_path(@book), "post" do

      assert_select "input#book_bk_title[name=?]", "book[bk_title]"

      assert_select "input#book_bk_isbn[name=?]", "book[bk_isbn]"

      assert_select "input#book_bk_author[name=?]", "book[bk_author]"
    end
  end
end
