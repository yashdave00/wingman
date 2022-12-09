Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users, :lines, only: [:index,:create]
  post 'mark_line_as_used', to: "line#mark_line_as_used"
end
