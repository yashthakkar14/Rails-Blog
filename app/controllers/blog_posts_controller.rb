class BlogPostsController < ApplicationController
    def index
        # The reason we are making use of the instance variable here, is that rails knows to share those with your erb template. If we use local variables, it will clear out after the index method finishes out executing but with the instance variables, we can keep them around.
        @blog_posts = BlogPost.all

        # All the blog posts will be now accessible in the views, as per the controller, the folder in the views will be blog_posts, and the template will be the same name as the name of the method. That is the index.html.erb template
    end

    def show
        @blog_post = BlogPost.find(params['id'])
    rescue

        # The root_path here is as defined with root in the routes. root_path and root_url variables is automatically created by rails
        redirect_to root_path
    end

    def new
        @blog_post = BlogPost.new
    end

    def create
        # @blog_post = BlogPost.new(params[:blog_post])
        @blog_post= BlogPost.new(blog_post_params)
        if @blog_post.save
          redirect_to @blog_post
        else
            render :new, status: :unprocessable_entity #render the new action
        end
    end

    private
    def blog_post_params
      params.require('blog_post').permit(:title, :body)
    end
end