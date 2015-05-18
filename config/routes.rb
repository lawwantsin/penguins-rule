Rails.application.routes.draw do
  resources :orders
  root 'orders#index'
  get 'workbench' => 'orders#workbench'
end
