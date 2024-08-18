require "test_helper"

class BlogPostTest < ActiveSupport::TestCase
  test "draft returns true for draft blog post" do
    # assert BlogPost.new(published_at: nil).draft?
    assert blog_posts(:draft).draft?
    # In the above blog_posts refer to blog_posts.yml and it gives us a method
  end

  test "draft returns false for published blog post" do
    # Here, we are expecting the test case to actually return false and therefore we are making use of the refute keyword.
    # refute BlogPost.new(published_at: 1.year.ago).draft?
    refute blog_posts(:published).draft?
  end

  test "draft returns false for scheduled blog post" do
    refute blog_posts(:scheduled).draft?
  end
  
  test "published returns false for draft blog post" do
    refute blog_posts(:draft).published?
  end

  test "published returns true for published blog post" do
    # Here, we are expecting the test case to actually return false and therefore we are making use of the refute keyword.
    assert blog_posts(:published).published?
  end

  test "published returns false for scheduled blog post" do
    refute blog_posts(:scheduled).published?
  end
  
  test "scheduled returns false for draft blog post" do
    refute blog_posts(:draft).scheduled?
  end

  test "scheduled returns false for published blog post" do
    # Here, we are expecting the test case to actually return false and therefore we are making use of the refute keyword.
    refute blog_posts(:published).scheduled?
  end

  test "scheduled returns true for scheduled blog post" do
    assert blog_posts(:scheduled).scheduled?
  end
  

  # Instead of writing the repetitive test cases as above, we can also write a helper function, however this is the exact same purpose of a fixture file, where we can separate the logic from the test file.

  def draft_blog_post
    BlogPost.new(published_at: nil)
  end
end
