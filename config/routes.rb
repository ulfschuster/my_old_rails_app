Rails.application.routes.draw do
	resources :users, only: [:products, :index, :show, :create, :destroy]
	#resources :orders, only: [:index, :show, :create, :destroy]

  resources :products

  get 'static_pages/about'

  get 'static_pages/contact'

  get 'static_pages/index'

  get 'static_pages/landing_page'

  #get '/products', to: 'products#index' #Example: Get request for non-static page (cf. ex. 5.1)

  #root 'static_pages#index' #The first root entry defines which page will be shownwhen the application receives a request without a path (i.e. hocalhost:3000)
  
  root 'static_pages#landing_page' #This root will be ignored because the root to 'static_pages#index is first in line. // Sets the root of the rails app to the controller static_pages and the landing page. The controller for the static page needs to be referenced in the routes.rb file like this. Otherwise, the user cannot access the page.
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
