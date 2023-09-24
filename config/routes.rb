Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  post "authenticate", to:"authentication#authenticate"
  post "signup", to:"signup#signup"
  post "login", to:"login#login"
  get "logout", to:"logout#invalidate_token"
  get "/show_user_by_user_email", to:"user#show_user_by_user_email"
  get "/article_by_user_id", to: "article#article_by_user_id"
  post "/create_article", to: "article#create_article"
  get "/", to:"user#home"
  get "/show_all_articles", to:"article#show_all_articles"
  get "/show_user_profile", to:"article#show_user_profile"
  delete "/delete_article", to:"article#delete_article"
  put "/update_article", to:"article#update_article"
  get "/show_article_by_id", to:"article#show_article_by_id"
  get "/show_articles_by_cat_name", to:"article#show_articles_by_cat_name"

  get "/show_all_categories", to:"category#show_all_categories"
  post "/add_category", to:"category#add_category"
  put "/update_user", to: "article#update_user"
  delete "/delete_user", to: "article#delete_user"
  # delete '/logout', to: 'mycontroller#destroy'
  # delete "/destroy_token", to: "article#destroy_token"
  # post '/images', to: 'images#create'
  post "/increse_likes", to:"article#increse_likes"
  post "/increse_comments", to:"article#increse_comments"
  delete "/decrease_likes", to:"article#decrease_likes"
  delete "/decrease_comments", to:"article#decrease_comments"
  get "/show_likes_of_article", to:"article#show_likes_of_article"
  get "/show_comments_of_article", to:"article#show_comments_of_article"
end
