Rails.application.routes.draw do
  resources :messages, only: %i[index create delete]
  root "messages#index"
end
