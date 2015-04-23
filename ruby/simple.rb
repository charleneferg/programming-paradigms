require 'singleton'

class Library
  include Singleton

  attr_accessor :library_object, :calendar, :books_available, :my_array, :members, :serve, :libraryid, :open

  #calendar object
  # my_array an array that reads and stores the lines of text file
  # books_available array that stores the book objects
  # members dictionary of members
  # open boolean library open or closed
  # library_object
  # serve - current member being served

  def initialize
    calendar = Calendar.instance
    @calendar = calendar


    my_array = IO.readlines('collections.txt')
    books_available = []
    my_array.each_with_index do |line, index|
      title, author = line.chomp.split(/,/)
      id = index + 1
      books_available << Book.new(id, title, author)
    end

    @members = {}

    @open = false

    @serve = nil

    @libraryid = self.object_id

  end

  def open()

    if @open == true
      raise 'The library is already open!'
    end

    calendar.advance
    @open = true
    puts "Today is day #{calendar.get_date}"

  end

  def find_all_overdue_books
    raise 'The library is not open!' unless @open

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

  def search(string)
    raise 'The library is not open!' unless @open
  end

  def check_out(*book_ids)
    raise 'The library is not open!' unless @open
  end

  def renew(*book_ids)
    raise 'The library is not open!' unless @open
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
  def
  get_id()
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
    @due_date = due_date

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


class Member

  # A member is a "customer" of the library.
  # A member must have a library card in order to check out books.
  # A member with a card may have no more than three books checked out at any time.
  attr_accessor :close, :books_out, :book

  #Constructs a member with the given name, and no books.
  # The member must also have a reference to the Library object that he/she uses.

  def
  initialize(name, library)
    @name = name
    @library = library
    @books_out = []
  end

  #Returns this member's name.

  def
  get_name()
    @name
  end

  #Adds this Book object to the set of books checked out by this member.
  def
  check_out(book)
    if @card == true
      books_out.push book
    else
      puts "#{@name} does not have a library card"
    end
  end


  #Removes this Book object from the set of books checked out by this member.
  # (Since members are usually said to "return" books, this method should be called return !)
  def give_back(book)
    books_out.pop book
  end


  #Returns the set of Book objects checked out to this member (may be the empty set.)
  def get_books()
    @books_out
  end


  #Tells this member that he/she has overdue books.
  # (What the method actually does is just print out this member's name along with the notice.)
  def send_overdue_notice(notice)
    puts "Reminder #{@name}  #{notice}"
  end


end



