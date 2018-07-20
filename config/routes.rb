Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :questions do
    resources :choices, only: [:create, :destroy]
 end

  root "questions#index"
end
