class PokemonController < ApplicationController
  def index
    if params[:search]
      @pokemon = Pokemon.search(params[:search])
    else
      @pokemon = Pokemon.all
    end
  end

  def show
    @pokemon = Pokemon.find(params[:id])
  end
end
