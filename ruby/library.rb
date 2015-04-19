class Library

  require 'singleton'
  include Singleton

  def
  initialize
  end


  def
  close()
  end
  #Shut down operations and go home for the night.
  # None of the other operations (except quit) can be used when the library is closed.__id__ If successful,
  # returns the string "Good night.".
#May throw an Exception with the message The library is not open.


def
  quit()
end

#The mayor, citing a budget crisis, has stopped all funding for the library. Can happen at any time.
#Returns the string  The library is now
#closed for renovations.”.


end

####

class Calendar
  require 'date'
  include Singleton


  def initialize()
    @date = 0

  end

  #Returns (as an integer) the current date.

  def get_date()

    now = DateTime.now
    @date = now
    puts "before converted to integer {}"
    @date = @date.to_int
  end

  #Increment the date (move ahead to the next day), and returns the new date.

  def advance()

    @date = now.day + 1
    puts "It is #{now.day} today"

    puts "Tomorrow is #{now.day + 1} "


  end

end

####

class Member

  # A member is a "customer" of the library.
  # A member must have a library card in order to check out books.
  # A member with a card may have no more than three books checked out at any time.

  def
  initialize(name, library)
  end

  #Constructs a member with the given name, and no books.
  # The member must also have a reference to the Library object that he/she uses.
  def
  get_name()
  end

  #Returns this member's name.


  def
  check_out(book)
  end

  #Adds this Book object to the set of books checked out by this member.
  def
  give_back(book)
  end

  #Removes this Book object from the set of books checked out by this member.
  # (Since members are usually said to "return" books, this method should be called return !)

  get_books()
  #Returns the set of Book objects checked out to this member (may be the empty set.
  def
  send_overdue_notice(notice)
  end
  #Tells this member that he/she has overdue books.
  # (What the method actually does is just print out this member's name along with the notice.)

end

####

class Book

  #A book has these attributes (instance variables): id, title,
  #author (only one author per book), and due_date.
  # The due date is nil if the book is not checked out.

  @id
  @title
  @author
  @due_date

  #The constructor. Saves the provided information. When created, the book is not checked out.

  def
  initialize(id, title, author)
    @id = id
    @title = title
    @author = author
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


  end

  #Sets the due date of this Book to nil. Doesn't return anything.
  def
  check_in()
    @due_date = 0
  end

  #Returns a string of the form "id: title, by author”.
  def
  to_s()
    "Book id: #{@id}, Title: #{@title}, By author:  #{@author}"
  end


end