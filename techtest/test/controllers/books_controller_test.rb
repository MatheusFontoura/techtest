require "test_helper"

class BooksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get books_index_url
    assert_response :success
  end

  test "should get show" do
    get books_show_url
    assert_response :success
  end

  test "should get create" do
    get books_create_url
    assert_response :success
  end

  test "should get reserve" do
    get books_reserve_url
    assert_response :success
  end

  #all books
  #filters
  #book with reservations
  #book available
  #create ok
  #create error (rescue)
  #reserves
end
