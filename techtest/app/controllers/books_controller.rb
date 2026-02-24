class BooksController < ApplicationController
  def index
    @books = Book.includes(:reservations)
    @books = @books.where(status: params[:status]) if params[:status].present?
    render json: @books, include: :reservations
  end

  def show
    @book = Book.includes(:reservations).find(params[:id])
    render json: @book, include: :reservations
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Book not found" }, status: :not_found
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      render json: @book, status: :created
    else
      render json: { error: @book.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def reserve
    @book = Book.find(params[:id])

    if @book.status == "reserved"
      render json: { error: "Book is already reserved" }, status: :unprocessable_entity
      return
    end

    if params[:email].blank?
      render json: { error: "Email is required" }, status: :unprocessable_entity
      return
    end

    reservation = @book.reservations.new(email: params[:email], status: "reserved")

    if reservation.save
      @book.update!(status: "reserved")
      render json: reservation, status: :created
    else
      render json: { error: reservation.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :author)
  end
end
