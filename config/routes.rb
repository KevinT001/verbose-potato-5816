Rails.application.routes.draw do

  get 'customers/:id', to: 'customers#show'

post '/customers/:customer_id/customer_items', to: 'customer_items#create'




end
