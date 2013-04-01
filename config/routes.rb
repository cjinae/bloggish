Blog::Application.routes.draw do
  root :to => 'home#index'

  resources :posts do
    resources :comments
  end 
end



# note: a post has many comments, comments belong to a post
# calling @post.comment will return an array of comments on that post.