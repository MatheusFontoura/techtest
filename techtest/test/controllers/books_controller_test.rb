require "test_helper"

class BooksControllerTest < ActionDispatch::IntegrationTest
  test "cannot reserve already reserved" do
      post reserve_book_url(books(:reserved_book)),
           params: { email: "user@test.com" },
           as: :json
    
      assert_response :unprocessable_entity
      assert_equal "Book is already reserved", response.parsed_body["error"]
  end

  test "reserve sucess available" do
    book = books(:available_book)
    post reserve_book_url(book), params: { email: "user@test.com" }
    assert_response :created
    book.reload
    assert_equal "reserved", book.status
  end

  #all books
  #filters
  #create ok
  #create error (rescue)
  #reserves
end
