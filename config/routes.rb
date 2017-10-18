Rails.application.routes.draw do
  get 'products/index'
  root 'welcome#index'

  get 'item_upload' => 'products#item_upload'
  get 'export_all' => 'products#csv_export'
  get 'generate_catalog' => 'products#generate_catalog'
  get 'generate' => 'products#generate'
  resources :products do
  	collection { post :import }
  end

  get 'export_all' => 'products#csv_export'

end

