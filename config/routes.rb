Whatdo::Application.routes.draw do
  root "high_voltage/pages#show", id: "home"

  devise_for :users
  resources  :ideas
end