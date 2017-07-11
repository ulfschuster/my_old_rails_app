Rails.application.routes.draw do
  get 'static_pages/about'

  get 'static_pages/contact'

  get 'static_pages/index'
  root 'static_pages#index' #Sets the root of the rails app to the controller static_pages and the page index. The controller for the static page needs to be referenced in the routes.rb file like this. Otherwise, the user cannot access the page.
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
