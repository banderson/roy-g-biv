Rails.application.routes.draw do
  root 'colors#index'

  # we don't have ID's, so these look funny
  get 'colors/next' => 'colors#show'
  post 'colors/' => 'colors#create'
end
