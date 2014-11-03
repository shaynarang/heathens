Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'home#index'
  get 'display_content', to: 'home#display_content'
  post 'create_message', to: 'messages#create'
  get 'filter_posts', to: 'posts#filter'
end
