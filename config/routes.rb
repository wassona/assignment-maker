Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

resources :assignments
resources :courses

root 'home#index'

get 'assignments/:id/take' => 'assignments#take', as: 'take_assignment'

post '/assignments/:id' => 'assignments#enter_answers', as: 'enter_answers'

get 'assignments/:id/delete' => 'assignments#destroy', as: 'delete_assignment'

delete 'assignments/:id/delete' => 'assignments#remote_destroy'

get 'courses/:id/delete' => 'courses#destroy', as: 'delete_course'

get '/users' => 'users#index', as: 'users'

get '/users/:id' => 'users#show', as: 'user'

post '/courses/add_students' => 'courses#add_students'

get '/courses/:id/course_student/:student_id' => 'courses#course_student', as: 'course_student'

delete '/courses/:id/remove_student/:student_id' => 'courses#remove_student', as: 'remove_student'



end
