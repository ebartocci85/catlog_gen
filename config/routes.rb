Rails.application.routes.draw do
  get 'products/index'
  root 'welcome#index'
  resources :products do
  	collection { post :import }
  end

  get 'export_all' => 'products#csv_export'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

