Rails.application.routes.draw do
  get 'products/index'
  root 'products#index'
  resources :products
  get 'export_all' => 'products#csv_export'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
