class PagesController < ApplicationController
  def batman
  end

  def superman
  end

  def batman_vs_superman
  	@total_batman = (Vote.group(:heroe).count).to_a[0][1]
  	@total_superman = (Vote.group(:heroe).count).to_a[1][1]
  end

  def vote
  	@vote = Vote.new(heroe: params[:heroe], email: params[:email])
  	if @vote.save
  		redirect_to root_path,
  			notice: "Se ha guardado su voto"
  	else
  		redirect_to root_path,
  			alert: "No hemos podido guardar su voto, inténtalo de nuevo"
  	end
  end
end
