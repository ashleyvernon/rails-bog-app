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

	#create a new creature from 'creature_params'
		creature = Creature.new(creature_params)

	#if creature saves, redirect to route that displays ONLY 
	#the newly created creature
		if creature.save
			redirect_to creature_path(creature)
		#redirect_to creatures_path is equivalent to:
		#redirect_to "/creatures"
		end
	end

	#display a specific creature
	def show
		#get the creature id from the url params
		creature_id = params[:id]

		#use the 'creature_id' to find the creature in the database
		#and save it to an instance variable
		@creature = Creature.find_by_id(creature_id)

		#render the show view (it has access to instance variable)
		#remember the default behavior is to render :show
	end

	def edit
		#get the creature id from the url params
		creature_id = params[:id]

		#use 'creature_id' to find the creature in the databse
		#and save it to an instance variable
		@creature = Creature.find_by_id(creature_id)
	end

	def update
		#get the creature id from the url params
		creature_id = params[:id]

		#use creature id to find hte creature in the database
		#and save it to an instance variable
		creature = Creature.find_by_id(creature_id)

		#update the creature
		creature.update_attributes(creature_params)

		#redirect to show page for the updated creature
		redirect_to creature_path(creature)
		#this is equivalent to: redirect_to "/creatures/#{creature.id}"
	end

	def destroy
		creature_id = params[:id]

		creature = Creature.find_by_id(creature_id)

		creature.destroy

		redirect_to creatures_path
	end

	private

	def creature_params
		#whitelist params return whitelisted version
		params.require(:creature).permit(:name, :description)
	end


end
