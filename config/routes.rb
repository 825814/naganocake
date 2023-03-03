Rails.application.routes.draw do

  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  devise_for :admins, skip: [:passwords, :registrations], controllers: {
    sessions: "admin/sessions"
  }

 scope module: :public do
   get '/' => "homes#top"
   get '/about' => "homes#about"

   get '/customers/my_page' => "customers#show"
   get '/customers/information/edit' => "customers#edit"
   patch '/customers/information' => "customers#update"
   get '/customers/unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe'
   patch '/customers/withdraw' => 'customers#withdraw', as: 'withdraw'

   resources :addresses, only: [:create, :index, :edit, :update]
   resources :items, only: [:index, :show]

 end

  namespace :admin do

    get '/' => "homes#top"
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, only: [:new, :create, :index, :show, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]



  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
