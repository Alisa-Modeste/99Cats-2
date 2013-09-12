NinetyNineCats::Application.routes.draw do
  resources :cats
  resources :cat_rental_requests do
    match '/approve' => 'cat_rental_requests#approve'
    match '/deny' => 'cat_rental_requests#deny'
  end

  resources :users do
    resources :session
  end

end
