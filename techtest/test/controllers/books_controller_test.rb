require "test_helper"

class BooksControllerTest < ActionDispatch::IntegrationTest
  test "cannot reserve already reserved" do
      post reserve_book_url(books(:reserved_book)),
           params: { email: "user@test.com" },
           as: :json
    
      assert_response :unprocessable_entity
      assert_equal "Book is already reserved", response.parsed_body["error"]
  end

  #all books
  #filters
  #book with reservations
  #book available
  #create ok
  #create error (rescue)
  #reserves
end
