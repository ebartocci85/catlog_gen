Rails.application.routes.draw do
  get 'products/index'
  root 'welcome#index'

  get 'item_upload' => 'products#item_upload'
  get 'export_all' => 'products#csv_export'
  get 'generate_catalog' => 'products#generate_catalog'
  get 'generate' => 'products#generate'
  post 'csv_gen' => 'products#csv_gen'

  resources :products do
  	collection { post :import }
  end


end

