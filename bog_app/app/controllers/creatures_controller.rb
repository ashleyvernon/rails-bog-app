class CreaturesController < ApplicationController
	#displays all creatures
	def index
		#gets all creatures from db and saves to instance variable
		@creatures = Creature.all
		#render the index view (it has access to instance variable)
		#remembers default behavior is to render :index
	end

	#show the new creature form
	def new
		@creature = Creature.new
		#remember the default behavior is to render :new
	end

	#create a new creature in the database
	def create
	#whitelist params and save them to a variable
		creature_params = params.require(:creature).permit(:name, :description)

	#create a new creature from 'creature_params'
		creature = Creature.new(creature_params)

	#if creature saves, redirect to route that displays all creatures
		if creature.save
			redirect_to creatures_path
		#redirect_to creatures_path is equivalent to:
		#redirect_to "/creatures"
		end
	end


end
