SampleTodo::Application.routes.draw do

  devise_for :users
  
  devise_scope :user do
    get "users/sign_out", :to => "devise/sessions#destroy"
  end

  root 'tasks#index'
  
  resources :tasks do
    get "done", to: "tasks#done"
  end

end
