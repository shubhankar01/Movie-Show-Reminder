class MoviesController < ApplicationController
  def new
  end
  def show
   @movie=Movie.get_movie(params[:id])
  end
  def search
    @movie=Movie.search(params[:search])
  end
  
end
