Rails.application.routes.draw do
  devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}, :controllers => {:registrations => "registrations"}
  #devise_for :users,  :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}, :controllers => {:registrations => "user_registrations"}
  resources :users
	resources :users, only: [:products, :index, :show, :create, :destroy]
  resources :posts #Added in 5.5
  resources :orders, only: [:index, :show, :create, :destroy]

  resources :products do
    resources :comments
  end

  get 'static_pages/about'

  get 'static_pages/contact'

  get 'static_pages/index'

  get 'static_pages/landing_page'

  get 'orders/index'

  get 'orders/show'

  get 'users/form'

  get 'users/show'

  get 'users/index'

  get 'users/edit'

  get 'users/new'

  post 'payments/create'
  get 'payments/create'

  #get '/products', to: 'products#index' #Example: Get request for non-static page (cf. ex. 5.1)

  #root 'static_pages#index' #The first root entry defines which page will be shownwhen the application receives a request without a path (i.e. hocalhost:3000)
  
  root 'static_pages#landing_page' #This root will be ignored because the root to 'static_pages#index is first in line. // Sets the root of the rails app to the controller static_pages and the landing page. The controller for the static page needs to be referenced in the routes.rb file like this. Otherwise, the user cannot access the page.
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post 'static_pages/thank_you'
  
end
