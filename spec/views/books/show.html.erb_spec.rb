require 'rails_helper'

RSpec.describe "books/show", :type => :view do
  before(:each) do
    @book = assign(:book, Book.create!(
      :title => "Bk Title",
      :isbn => 1,
      :author => "Bk Author"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Bk Title/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Bk Author/)
  end
end
