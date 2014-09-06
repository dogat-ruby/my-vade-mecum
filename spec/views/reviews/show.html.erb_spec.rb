require 'rails_helper'

RSpec.describe "reviews/show", :type => :view do
  before(:each) do
    @review = assign(:review, Review.create!(
      :text => "Text",
      :user_id => 1,
      :book_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Text/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
  end
end
