require "test_helper"

class BookTest < ActiveSupport::TestCase
  #test 
  test "valid book" do
    book = Book.new(title: 'FontouraTest', author: "Author", status: "available")
    assert book.valid?
  end
  # valid book
  # invalid book (title? author?)
  #
end
