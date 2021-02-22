Rails.application.routes.draw do
  
  get 'mersen/input'
  get 'mersen/output'
  root 'mersen#input'
  #post 'output' => 'mersen#output'
  get 'show_data' => 'mersen#show_data'
  get 'mersens', to: 'mersen#show_data', as: :mersen_all
end
