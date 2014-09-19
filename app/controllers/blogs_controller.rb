class BlogsController < ApplicationController
	def index
	end

	def index_all
		@blogs = Blog.all

		render :json => @blogs
	end

end
