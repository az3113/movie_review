class MoviesController < ApplicationController
  before_action :find_movie, only: [:show, :edit, :update, :destroy]
  def index
    @movies = Movie.all.order('created_at DESC')
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to @movie, notice: 'Movie was successfully created.'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @movie.update(movie_params)
      redirect_to @movie, notice: 'Movie was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @movie.destroy
    redirect_to root_path, notice: 'Movie was successfully destroyed.'
  end

  private
  def movie_params
    params.require(:movie).permit(:title, :description, :movie_length, :director, :rating)
  end

  def find_movie
    @movie = Movie.find(params[:id])
  end

end