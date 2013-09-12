NinetyNineCats::Application.routes.draw do
  resources :cats
  resources :cat_rental_requests do
    # match '/approve' => 'cat_rental_requests#approve'
#     match '/deny' => 'cat_rental_requests#deny'

# cat_rental_request_approve        /cat_rental_requests/:cat_rental_request_id/approve(.:format) cat_rental_requests#approve
#    cat_rental_request_deny        /cat_rental_requests/:cat_rental_request_id/deny(.:format)    cat_rental_requests#deny
#
    member do
      post "approve"
      post "deny"
    end
  end

  resources :users, only: [:new, :create, :edit, :update, :destroy, :show]
  resource :session, only: [:new, :create, :destroy]


end
