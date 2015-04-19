
class Post
  attr_reader :author, :title, :body, :comments

=begin
 # Can use key value pairs instead.
def initialize author, title, body, comments
    @author = author
    @title = title
    @body = body
    @comments = comments

  end
=end

  def initialize options
    @author = options[:author]
    @title = options[:title]
    @body = options[:body]
    @comments = options[:comments] || [] # default is empty if no comment

  end

  def insert_comment *comments
    comments.each {|c| @comments << c} 

end

class Comment
  attr_reader :user, :body

  def initialize user, body
    @user = user
    @body = body

  end
end

#post = Post.new "Charlene F", "My first post", "The post is awesome", []

post = Post.new author: "Charlene",
                title: "My first post",
                body: "This second post is awesome",
                comments: []


p post.inspect