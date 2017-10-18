Rails.application.routes.draw do
  get 'products/index'
  root 'welcome#index'
  resources :products
  get 'export_all' => 'products#csv_export'
  get 'generate_catalog' => 'products#generate_catalog'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
