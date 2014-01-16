class PlayerController < ApplicationController
	def index
		@players = Player.all
	end

	def new
		@player = Player.new
	end
	
	def create
		@player = Player.new(player_params)
    	if @player.save
      		@players = Player.all
     		render "index"
    	else
    		render "new"
   	 end
	end
	
	def update										
		player = Player.find(params[:player][:id])
		#new_score = params[:player][:score] + player.score
		player.update_attributes(player_params)
		@players = Player.all
     		render "index"
	end
	private
	def player_params
		params.require(:player).permit(:name, :score)
	end
end
