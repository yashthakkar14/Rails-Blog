class BlogPostsController < ApplicationController
    def index
        # The reason we are making use of the instance variable here, is that rails knows to share those with your erb template. If we use local variables, it will clear out after the index method finishes out executing but with the instance variables, we can keep them around.
        @blog_posts = BlogPost.all
    end

    def show
        @blog_post = BlogPost.find(params['id'])
    rescue
        redirect_to root_path
    end

    def new
        @blog_post = BlogPost.new
    end
end