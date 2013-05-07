Raffler::Application.routes.draw do
  resources :entries
  resources :programmers

  match "/fight/:person1/vs/:person2" => "rpg#fight"
  root to: 'rpg#index'

end
