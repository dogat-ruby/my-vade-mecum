require 'rails_helper'

RSpec.describe "books/show", :type => :view do
  before(:each) do
    @book = assign(:book, Book.create!(
      :bk_title => "Bk Title",
      :bk_isbn => 1,
      :bk_author => "Bk Author"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Bk Title/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Bk Author/)
  end
end
