Rails.application.routes.draw do
  get 'products/index'
  root 'welcome#index'
  resources :products
  get 'item_upload' => 'products#item_upload'
  get 'export_all' => 'products#csv_export'
  get 'generate_catalog' => 'products#generate_catalog'
  get 'generate' => 'products#generate'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
