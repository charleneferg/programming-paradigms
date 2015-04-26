require 'singleton'
require 'test/unit'

class Library
  include Singleton

  attr_accessor :calendar, :books_available, :my_array, :members, :serve, :libraryid, :open, :book_ids

  #calendar object
  # my_array an array that reads and stores the lines of text file
  # books_available array that stores the book objects
  # members dictionary of members
  # open boolean library open or closed
  # libraryid is the library object id
  # serve - current member being served
  # book_ids list of book ids returned from search method

  def initialize
    calendar = Calendar.instance
    @calendar = calendar
    my_array = IO.readlines('collections.txt')
    books_available = []
    book_ids = []
    my_array.each_with_index do |line, index|
      title, author = line.chomp.split(/,/)
      id = index + 1
      books_available << Book.new(id, title, author)
    end

    @members = {}

    @open = false

    @serve = nil

    @libraryid = self.object_id

    @book_ids = book_ids

  end

  def open()

    if @open == true
      raise 'The library is already open!'
    end

    @calendar.advance
    @open = true
    puts "Today is day #{calendar.get_date}"

  end

  def find_all_overdue_books
    raise 'The library is not open!' unless @open
    current_date = calendar.get_date
    members.each do |k, v|
      book_list = v.get_books
      for i in book_list
        if current_date > book_list[i].get_due_date
          puts "#{k} #{book_list[i].to_s} "
        else
          puts "#{k} No books are overdue "
        end
      end
    end
  end

  def issue_card(name_of_member)
    raise 'The library is not open!' unless @open

    result = members.hash.member?(name_of_member)

    if result == true
      puts "#{name_of_member} already has a library card."
    else
      members.store(name_of_member, Member.new(name_of_member, @libraryid))
      puts "Library card is issued to #{name_of_member}."
    end

  end

  # @param [members] name_of_member
  def serve(name_of_member)
    raise 'The library is not open!' unless @open
    result = members.hash.member?(name_of_member)
    @serve = nil

    if result == true
      temp = members.value_at(name_of_member)
      @serve = temp[0]
      puts " Now serving #{name_of_member}."
    else
      puts " #{name_of_member} does not have a library card."
    end

  end

  def find_overdue_books
    raise 'The library is not open!' unless @open
  end

  def check_in(*book_numbers) # = 1..n book numbers

    raise 'The library is not open!' unless @open

    raise 'No member is currently being served.' unless @serve


    for j in @book_ids

      y = @book_ids[j]

      for i in @books_out

        value = @books_out[i]
        x = i.get_id

        if x == y
          value.check_in
          @serve.give_back(value)
          @books_available.push value
          count += 1
        end

      end


      if count == 0
        puts "The library does not have book #{y}."
      end

    end

  end

  def search(string)
    raise 'The library is not open!' unless @open
    myStr = string
    pattern = Regexp.new(myStr, 'i')
    unless myStr.length >= 4
      puts 'Search string must contain at least four characters'
    else

      @books_available.each_with_index do |line, index|
        tempString = line.to_s
        if tempString =~ pattern
          puts line
          temp_object =@books_available.at(index)
          @book_ids << temp_object.get_id
          count += 1
        end
      end

      if count == 0
        puts 'No books found'
      end

    end

  end

  def check_out(*book_ids) # = 1..n book ids
    raise 'The library is not open!' unless @open

    raise 'No member is currently being served.' unless @serve


    for j in book_ids

      y = book_ids[j]

      for i in @books_available

        value = @books_available[i]
        x = i.get_id

        if x == y
          value.get_due_date
          value.check_out
          @serve.check_out(value)
          @books_available.delete_at(i)
          count += 1
        end

      end


      if count == 0
        puts "The library does not have book #{y}."
      end

    end

  end


  def renew(*book_ids)
    raise 'The library is not open!' unless @open

    raise 'No member is currently being served' unless @serve

    for j in book_ids

      y = book_ids[j]

      for i in @books_out

        value = @books_out[i]
        x = i.get_id

        if x == y
          date = value.get_due_date
          @books_out[i].check_out(date)
          count += 1
        end

      end


      if count == 0
        puts "The library does not have book #{y}."
      end

    end

  end

  def close

    raise 'The library is not open!' unless @open
    @open = false
    puts 'Good night'


  end

  def quit

    puts 'The library is now closed for renovations'

  end


end


class Calendar
  require 'date'
  include Singleton
  attr_accessor :date

  def initialize()

    @date = 0
  end

  #Returns (as an integer) the current date.

  def get_date()
    @date
  end

  #Increment the date (move ahead to the next day), and returns the new date.

  def advance()
    @date += 1
  end

end


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


class Book

# A book has these attributes (instance variables): id, title,
# author (only one author per book), and due_date.
# The due date is nil if the book is not checked out.

  attr_accessor :due_date

#The constructor. Saves the provided information. When created, the book is not checked out.

  def
  initialize(id, title, author)
    @id = id
    @title = title
    @author = author
    @due_date = nil
  end


# Returns this book's unique identification number.
  def get_id()
    @id
  end

#Returns this book's title.

  def
  get_title()
    @title
  end

#Returns this book's author.
  def
  get_author()
    @author
  end

#Returns the date (as an integer) that this book is due.

  def
  get_due_date()
    @due_date
  end

#Sets the due date of this Book. Doesn't return anything.
  def
  check_out(due_date)

    if @due_date == nil
      @due_date = 0
    end

    @due_date += 7

  end

#Sets the due date of this Book to nil. Doesn't return anything.
  def
  check_in()
    @due_date = nil
  end

#Returns a string of the form "id: title, by author”.
  def
  to_s()
    "Book id: #{@id}, Title: #{@title}, By author:  #{@author}"
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

class Member

  # A member is a "customer" of the library.
  # A member must have a library card in order to check out books.
  # A member with a card may have no more than three books checked out at any time.
  attr_accessor :close, :books_out, :book, :notice

  BOOK_LIMIT = 3
  #Constructs a member with the given name, and no books.
  # The member must also have a reference to the Library object that he/she uses.

  def
  initialize(name, library)
    @name = name
    @library = library
    books_out = []
    @books_out = books_out
    @notice = 'this book is overdue'
  end

  #Returns this member's name.

  def
  get_name()
    @name
  end

  #Adds this Book object to the set of books checked out by this member.
  def
  check_out(book)

    puts "#{self.get_name} does not have a library card" unless members.hash.member?(self.get_name)

    if @books_out.length < BOOK_LIMIT
      books_out << book
    end

  end


  #Removes this Book object from the set of books checked out by this member.
  # (Since members are usually said to "return" books, this method should be called return !)
  def give_back(book)
    books_out.delete_if { |book| books_out.include?(book) }

  end


  #Returns the set of Book objects checked out to this member (may be the empty set.)
  def get_books()
    @books_out
  end


  #Tells this member that he/she has overdue books.
  # (What the method actually does is just print out this member's name along with the notice.)
  def send_overdue_notice(notice)
    p "Reminder #{get_name} #{notice}"
  end


end


class MemberTest < Test::Unit::TestCase

  def setup
    library1 = Library.instance
    @member = Member.new 'Carmel Christie' , library1.object_id

  end

  def test_get_name
    assert_equal 'Carmel Christie', @member.get_name
  end


  def test_send_overdue_notice
    notice = 'this book is overdue'
    assert_equal 'Reminder Carmel Christie this book is overdue', @member.send_overdue_notice(notice)
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
    #assert_raise(ArgumentError) { Person.new('J', 'Y', -4) }
  end
end

class LibraryTest < Test::Unit::TestCase

  def setup
    library1 = Library.instance
    @member = Member.new 'Carmel Christie' , library1.object_id

  end

  def test_find_all_books
    assert_equal 'Carmel Christie', @member.get_name
  end




  def test_check_out

    book1 = Book.new( 1, 'Contact', 'Carl Saga')
    members ={}
    members.store('Carmel Christie', @member)
    assert(true, @books_out.empty?)
    assert_equal @books_out[], @member.check_out(book1)
    assert(false, @books_out.empty?)
    #assert_raise(ArgumentError) { Person.new('J', 'Y', -4) }
  end
end


