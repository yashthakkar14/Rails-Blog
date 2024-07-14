Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/blog_posts/new", to: "blog_posts#new", as: :new_blog_post
  get "/blog_posts/:id", to: "blog_posts#show", as: :blog_post
  post "/blog_posts", to:"blog_posts#create", as: :blog_posts

  # The root keyword helps us to set the root route, before the #, we have the controller present and after the #, we have the method of the specific controller. 
  root "blog_posts#index" # Here, the root specifies localhost:3000, and we are attaching the controller along with the method.
end
