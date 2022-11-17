Rails.application.routes.draw do
  post "/alexa", to: "alexa#alexa"
  resources :foods
end
