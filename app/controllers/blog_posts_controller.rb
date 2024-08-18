class BlogPostsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :set_blog_post, except: [:index, :new, :create] # only: [:show, :update, :destroy]

    def index
        @blog_posts = user_signed_in? ? BlogPost.sorted : BlogPost.published.sorted
    end

    def show
        # Missed clearing this out in the refactoring code.
    end

    def new
        @blog_post = BlogPost.new
    end

    def create
        @blog_post= BlogPost.new(blog_post_params)
        if @blog_post.save
          redirect_to @blog_post
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        # Refactoring
    end

    def update
        # Refactor
        if @blog_post.update(blog_post_params)
            redirect_to @blog_post
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
      @blog_post.destroy
      redirect_to root_path
    end

    private
    def blog_post_params
      params.require('blog_post').permit(:title, :body, :published_at)
    end

    def set_blog_post
        # If the user is signed in, we can look into any blog posts or we just need to look into the published blog posts.
        @blog_post = user_signed_in? ? BlogPost.find(params[:id]) : BlogPost.published.find(params[:id])
    rescue ActiveRecord::RecordNotFound
        redirect_to root_path
    end

    ## This method is defined by the devise gem itself, and we might not need to define the same, but this is what it might be doing behind the scenes.
    # def authenticate_user!
    #   redirect_to new_user_session_path, alert: "You must sign up or log in to continue." unless user_signed_in?
    # end
end