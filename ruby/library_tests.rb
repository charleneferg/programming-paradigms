require 'singleton'
require 'test/unit'
require_relative 'library'


class CalendarTest < Test::Unit::TestCase
  def test_get_date
    calendar = Calendar.instance
    # assert_equal 0, calendar.get_date
  end


  def test_advance
    calendar = Calendar.instance
    calendar.advance
    assert_equal 1, calendar.get_date
  end

end

class BookTest < Test::Unit::TestCase

  def setup
    book = Book.new 1, 'Contact', 'Carl Saga'
  end

  def test_get_id
    assert_equal 1, Book.new( 1, 'Contact', 'Carl Saga').get_id
  end


  def test_check_in
    assert_equal nil, Book.new( 1, 'Contact', 'Carl Saga').check_in
  end

  def test_get_due_date
    assert_equal nil, Book.new( 1, 'Contact', 'Carl Saga').get_due_date
  end

  def test_check_out
    assert_equal 7, Book.new( 1, 'Contact', 'Carl Saga').check_out(nil)
  end

  def test_get_author
    assert_equal 'Carl Saga', Book.new( 1, 'Contact', 'Carl Saga').get_author
  end

  def test_get_title
    assert_equal 'Contact', Book.new( 1, 'Contact', 'Carl Saga').get_title
  end

end



class MemberTest < Test::Unit::TestCase

  def setup
    library1 = Library.instance
    library1.serve 'Carmel Christie'

  end

  def test_get_name
    assert_equal 'Carmel Christie', @member.get_name
  end


  def test_send_overdue_notice
    notice = 'this book is overdue'
    assert_equal 'Reminder Carmel Christie this book is overdue', sle.send_overdue_notice(notice)
  end



  def test_get_books
    @books_out = []
    # @books_out << Book.new( 1, 'Contact', 'Carl Saga')
    assert_equal [], @member.get_books
  end

  def test_check_out

    book1 = Book.new( 1, 'Contact', 'Carl Saga')
    members ={}
    members.store('Carmel Christie', @member)
    assert(true, @books_out.empty?)
    assert_equal @books_out[], @member.check_out(book1)
    assert(false, @books_out.empty?)
  end
end

class LibraryTest < Test::Unit::TestCase

  def setup
    library1 = Library.instance
    #@member = Member.new 'Carmel Christie' , library1

  end

  def test_issue_card_not_open
    exception = assert_raise(RuntimeError) do
      library1 = Library.instance
      library1.issue_card 'Nells Christie'
    end
    assert_equal 'The library is not open!', exception.message

  end

  def test_issue_card_open

  exception = assert_raise(RuntimeError) do
    library1 = Library.instance
    library1.open
    library1.issue_card 'Nells Christie'
  end
  assert_equal 'The library is not open!', exception.message
  end

  def test_issue_card

    assert(false, self.members.member?('Carmel Christie'))
    self.issue_card 'Carmel Christie'
    assert(true, self.members.member?('Carmel Christie'))
  end

  def test_serve
    library1 = Library.instance
    library1.issue_card 'Carmel Christie'
    assert_equal('Carmel Christie', library1.serve('Carmel Christie'))
  end

  def test_find_all_books
    assert_equal 'Carmel Christie', @member.get_name
  end


  def test_check_out
    library1 = Library.instance
    library1.issue_card 'Carmel Christie'
    book1 = Book.new( 1, 'Contact', 'Carl Saga')
    assert(true, @books_available.empty?)
    assert_equal @books_out[], @member.check_out(book1)
    assert(false, @books_out.empty?)
  end
end


