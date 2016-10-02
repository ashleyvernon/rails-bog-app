Rails.application.routes.draw do
	root "creatures#index"

	get "/creatures", to: "creatures#index", as: "creatures"
	get "/creatures/new", to: "creatures#new", as: "new_creature"
	post "/creatures", to: "creatures#create", as: "create_creature"
	get "/creatures/:id", to: "creatures#show", as: "creature"
	get "/creatures/:id/edit", to: "creatures#edit", as: "edit_creature"
	patch "/creatures/:id", to: "creatures#update", as: "update_creature"
	destroy "/creatures/:id", to: "creatures#destroy", as: "destroy_creature"
end
