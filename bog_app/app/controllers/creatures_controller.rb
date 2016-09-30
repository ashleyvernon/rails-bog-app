class CreaturesController < ApplicationController
	#displays all creatures
	def index
		#gets all creatures from db and saves to instance variable
		@creatures = Creature.all
		#render the index view (it has access to instance variable)
		#remembers default behavior is to render :index
	end

end
