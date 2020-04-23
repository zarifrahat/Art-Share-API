Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

#   resources :users

#   get '/users', to: 'users#index' 
#   post '/users', to: 'users#create' 
#   get '/users/:id', to: 'users#show', as: 'user' #seems to apply to the prefix column of everything listed after
#   patch '/users/:id', to: 'users#update'
#   put '/users/:id', to: 'users#update'
#   delete '/users/:id', to: 'users#destroy'
#   get '/users/new', to: 'users#new', as: 'new_user'
#   get '/users/:id/edit', to: 'users#edit', as: 'edit_user'

  resources :artworks, only: [:create, :destroy, :show, :update] do
    resources :comments, only: [:index]
    resources :likes, only: [:create]
  end

  resources :comments, only: [:create, :destroy] do
    resources :likes, only: [:create]
  end

#   resources :lessons do
#     get 'complete', on: :member
#   end

# def complete
#     complete_step
#     redirect @lesson
#   end

# def complete_step
#     current_user.completions.create(completed_step: true, lesson_id: @lesson.id)
#   end
#   # ~~ OR ~~
#   def complete_step
#     @lesson.completions.create(completed_step: true, user_id: current_user.id)
#   end

  resources :users do
    resources :artworks, only: [:index] do
        member do
            patch 'add_favorite'
            patch 'remove_favorite'
        end
    end
    resources :comments, only: [:index]
    get 'favorites', on: :member
  end

  resources :artwork_shares, only: [:create, :destroy]
  resources :likes, only: [:index, :destroy]
end

# get users/1/likes
# get artworks/18/likes
# get comments/12/likes

# get /likes/?user=1
# get /likes/?artwork=18
# get /likes/?comment=12
