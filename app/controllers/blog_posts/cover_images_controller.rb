class BlogPosts::CoverImagesController < ApplicationController
    include ActionView::RecordIdentifier # We will include this for the dom_id method


    before_action :authenticate_user!
    before_action :set_blog_post

    def destroy
        @blog_post.cover_image.purge_later
        respond_to do |format|
            format.html { redirect_to edit_blog_post_path(@blog_post ) }
            format.turbo_stream {render turbo_stream: turbo_stream.remove(dom_id(@blog_post, :cover_image))}
        end
    end

    def set_blog_post
        @blog_post = BlogPost.find(params[:blog_post_id])
        # We need to mention here, blog_post_id instead of just id because the id param here would be reserved for the cover image and not blog post and for the blog post, which is the parent of the cover image, we will be having the blog_post_id reserved for the same. Refer to rails routes -g cover_image for more.
    end
end