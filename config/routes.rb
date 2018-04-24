Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => "user_comments#new"
  post "create" => "user_comments#create", :as => "comment_create"
end
