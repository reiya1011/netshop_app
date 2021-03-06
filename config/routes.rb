Rails.application.routes.draw do

  root   'static_pages#home'
  get '/about', to: 'static_pages#about'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get '/admin/home', to: 'static_pages#admin'
  
  resources :items do
   collection do
    get :new_work
   end
   get :woman, :mens do
     get :category
   end
  end
  
  resources :shopping, only: [:show, :create, :update] do
   collection do
    get :order
   end
  end
  
  resources :purchase, only: [:index, :show, :create] do
   collection do
    get :history
   end
  end
  

  resources :account_activations, only: [:edit]
  resources :users, only:[:show, :index, :create, :update, :destroy]
  resources :likes, only:[:index, :create, :destroy]
  resources :carts, only:[:show, :create, :destroy, :update]
  resources :search, only: [:index]
  resources :contacts, only: [:index, :show, :new, :create]
  resources :quantitys, only: [:update]
  resources :user_info, only: [:create, :update]
  resources :password_resets, only: [:new, :create, :edit, :update]

end
