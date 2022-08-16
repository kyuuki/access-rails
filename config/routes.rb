Rails.application.routes.draw do
  get 'static_page/root'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/acc.png",  to: "static_page#access"
end
