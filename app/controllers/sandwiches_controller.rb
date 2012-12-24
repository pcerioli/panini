class SandwichesController < ApplicationController

  def index

    if params[:category] && !params[:category].blank?
      @category = params[:category]
      @sandwiches = Sandwich.where("category=?", @category).paginate  :page => params[:page], :order => 'id ASC'

    else
      @sandwiches = Sandwich.paginate  :page => params[:page], :order => "id ASC"
    end

    respond_to do |format|
      format.html 
      format.js
    end
  end


  def show
    @sandwich = Sandwich.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sandwich }
      format.js
    end
  end


end
