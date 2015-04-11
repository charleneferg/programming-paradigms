class Post
	attr_reader :author, :title, :body, :comments

	def initialize author, title, body, comments = []
		@author = author
		@title = title
		@body = body
		@comments = comments

	end
end

class Comment
	attr_reader :user, :body

	def initialize user, body
		@user = user
		@body = body

	end
end

#post = Post.new "Charlene F", "My first post", "The post is awesome", []

p post.inspect