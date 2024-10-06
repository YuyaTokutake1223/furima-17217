Rails.application.routes.draw do
  devise_for :users

  root "items#index"
  resources :items, only: [:index, :new, :create] #:edit, :update, :show
  resources :orders, only: :index
# 先の段階で実装するため一旦コメントアウト（10/07）
end
  