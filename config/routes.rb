  Rails.application.routes.draw do
     root "lunch_details#index"
     resources :users
     resources :lunch_details
     resources :daily_invoices
     match "daily_details" => "daily_invoices#daily_details", :as => :daily_details, :via => [:get, :post]
     match "/"=> "expense_manager#dashboard",:via => [:get, :post]
     match "month_details" => "users#month_details",  :via => [:get, :post]
     match "month_info" => "users#month_info", :via => [:get, :post]
     resources :user_payments
     resources :payment_modes
     resources :bootstraps
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end
