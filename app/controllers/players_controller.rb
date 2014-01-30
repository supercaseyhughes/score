class PlayersController < ApplicationController
	def index
		@players = Player.all.order('score DESC')
	end

	def top_3
		@players = Player.all.order('score DESC').limit(3)
		render :index
	end

	def new
		@player = Player.new
	end
	
	def create
		@player = Player.new(player_params)
    	if @player.save
      		@players = Player.all.order('score DESC').limit(3)
     		render "index"
    	else
    		render "new"
   	 end
	end
	
	def update										
		player = Player.find(params[:id])
		score = player_params[:score].to_i + player.score.to_i
		player.update_attributes(score: score)
		@players = Player.all.order('score DESC').limit(3)
		score = 0
     		render "index"

	end
	def destroy
  		player = Player.find(params[:id])
  		player.destroy
 
  		@players = Player.all.order('score DESC').limit(3)
  		render "index"
end
	private
	def player_params
		params.require(:player).permit(:name, :score)
	end
end
