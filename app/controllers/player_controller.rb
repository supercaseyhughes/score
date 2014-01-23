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
		player = Player.find(params[:id])
		score = player_params[:score].to_i + player.score
		player.update_attributes(score: score)
		@players = Player.all
     		render "index"

	end
	def destroy
  		player = Player.find(params[:id])
  		player.destroy
 
  		@players = Player.all
  		render "index"
end
	private
	def player_params
		params.require(:player).permit(:name, :score)
	end
end
