Rails.application.routes.draw do
	root "creatures#index"

	get "/creatures", to: "creatures#index", as: "creatures"
	get "/creatures/new", to: "creatures#new", as: "new_creature"
	post "/creatures", to: "creature#create", as: "create_creature"
	get "/creatures/:id", to: "creatures#show", as: "show_creature"


end
