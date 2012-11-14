Rottenpotatoes::Application.routes.draw do
  resources :movies
  match 'movies/:id/similar' => 'movies#similar'
  root :to => redirect('/movies')
end
