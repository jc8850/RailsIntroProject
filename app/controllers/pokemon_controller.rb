class PokemonController < ApplicationController
  def index
    if params[:search]
      @pokemon = Pokemon.search(params[:search]).page params[:page]
    else
      @pokemon = Pokemon.order(:id).page params[:page]
    end
  end

  def show
    @pokemon = Pokemon.find(params[:id])
  end
end
