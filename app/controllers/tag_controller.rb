class TagController < ApplicationController
  def show
    @tag = Tag.find(params[:id])
    @books = Book.tagged_with(@tag.name)
  end
end
