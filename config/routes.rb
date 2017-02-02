Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root 'home#index'

get 'assignments/:id/take' => 'assignments#take', as: 'take_assignment'


post '/assignments/:id' => 'assignments#enter_answers', as: 'enter_answers'

resources :assignments
resources :courses


get 'courses/:id/delete' => 'courses#destroy', as: 'delete_course'

get 'assignments/:id/delete' => 'assignments#destroy', as: 'delete_assignment'

end
