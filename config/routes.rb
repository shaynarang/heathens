Rails.application.routes.draw do
  root 'home#index'
  get 'display_content', to: 'home#display_content'
end
