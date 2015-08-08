class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy,:follow,:unfollow]
  # check_authorization
  load_and_authorize_resource
  # before_action :authenticate_user!
  # GET /books
  # GET /books.json
  def index
    if current_user.try(:admin?)
      @books=Book.all
    else
      @books = Book.approved
    end
  end

  # GET /books/1
  # GET /books/1.json
  def show
    @book = Book.find(params[:id])
    authorize! :read, @book
    @review=@book.reviews.build
    #@user = User.find(@book.user_id)
  end

  # GET /books/new
  def new
    authorize! :create, Book
    @book = Book.new(params[:book])
  end

  # GET /books/1/edit
  def edit
    authorize! :edit, @book
  end

  # POST /books
  # POST /books.json
  def create
    @book = current_user.books.build(book_params)#Book.new(book_params)
    @book.owner=current_user
    authorize! :create,@book
    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        # format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        # format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        # format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        # format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book = Book.find(params[:id])
    #@user = User.find(@book.user_id)
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  def follow
    current_user.follow(@book)
    flash[:notice] = "Successfully followed this book..."
    redirect_to @book
  end
  def unfollow
    if current_user.following?(@book)
      current_user.stop_following(@book)
      flash[:notice] = "Successfully unfollowed this book..."
    else
      flash[:errors] = "you can not unfollow before following"
    end
    redirect_to @book
  end
  def search
    @query = Book.active.approved.ransack(params[:q])
    @books = @query.result(distinct: true).includes(:tags,:reviews).page(params[:tag]).to_a.uniq
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:title, :isbn, :author, :picture,:description,:tag_list)
    end
end
