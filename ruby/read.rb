class Book

# A book has these attributes (instance variables): id, title,
# author (only one author per book), and due_date.
# The due date is nil if the book is not checked out.

  attr_accessor :due_date

#The constructor. Saves the provided information. When created, the book is not checked out.

  def
  initialize( id, title, author)
    @id = id
    @title = title
    @author = author
    @due_date = nil
  end


# Returns this book's unique identification number.
  def
  get_id()
    #@id
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





my_array = IO.readlines('collections.txt')

books = []


my_array.each_with_index  do |line, index|
  title, author = line.chomp.split(/,/)
  id = index + 1
  books << Book.new(id, title, author)
end


i = 0
while i < books.length
  puts books[i]
  i += 1
end


