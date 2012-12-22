class SandwichesController < ApplicationController

  def index

    if params[:search]
      # @sandwiches = Sandwich.search(params[:search]).paginate  :page => params[:page],
      # :order => 'created_at DESC'

    else
      @sandwiches = Sandwich.paginate  :page => params[:page]
    end

    #@avatars = Avatar.limit(10)

    respond_to do |format|
      format.html 
      format.js
    end

  end

  # GET /sandwiches/1
  # GET /sandwiches/1.json
  def show
    @sandwich = Sandwich.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sandwich }
      format.js
    end
  end


end
