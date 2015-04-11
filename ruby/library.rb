class Calendar
  require 'date'

  attr_accessor :date

  def initialize()
    @date = 0

  end

  #Returns (as an integer) the current date.

  def get_date()

    return @date
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

  attr_accessor :id, :title, :author, :due_date

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
    @due_date.to_i
  end

#Sets the due date of this Book. Doesn't return anything.
  def
  check_out(due_date)


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
  attr_accessor :name, :libraryref, :close

  #Constructs a member with the given name, and no books.
  # The member must also have a reference to the Library object that he/she uses.

  def
  initialize(name, library)
    @name = name
    @libraryref = library
  end

  #Returns this member's name.

  def
  get_name()
    @name
  end

  #Adds this Book object to the set of books checked out by this member.
  def
  check_out(book)
  end


  #Removes this Book object from the set of books checked out by this member.
  # (Since members are usually said to "return" books, this method should be called return !)
  def
  give_back(book)
  end


  #Returns the set of Book objects checked out to this member (may be the empty set.)
  def
  get_books()
  end


  #Tells this member that he/she has overdue books.
  # (What the method actually does is just print out this member's name along with the notice.)
  def
  send_overdue_notice(notice)
  end


end

class Library

  #require_relative 'collection'
  #require 'singleton'
  #include Singleton

  attr_accessor :closed

  def
  initialize
  end


  #Shut down operations and go home for the night.
  # None of the other operations (except quit) can be used when the library is closed.__id__ If successful,
  # returns the string "Good night.".
  #May throw an Exception with the message The library is not open.


  def
  close()

   raise LibraryNotOpenError, "The library is not open exception." if @closed == true
  else
    @closed = true
    puts "Good night"
  end


def
quit()
end

#The mayor, citing a budget crisis, has stopped all funding for the library. Can happen at any time.
#Returns the string  The library is now
#closed for renovations.”.


end

class LibraryNotOpenError < StandardError

end


#Test Create Calendar object and output Calendar methods
calendar = Calendar.new
puts calendar.inspect
calendar.get_date
p "The current date is #{calendar.date} ."
calendar.advance
p "The current date is #{calendar.date} ."

#Test Create Book object and output Book methods

book = Book.new 1, "Lord of the Rings", "Tolkien"

puts book
p "The current title is #{book.title}."
p "The current author is #{book.author}."
p "The current due date is #{book.due_date.to_i}."



LibraryObject = Library.new
#puts LibraryObject.close


begin

puts LibraryObject.close

rescue Library::LibraryNotOpenError
  puts "The library is not open."

ensure

  end