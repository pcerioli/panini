class OrdersController < ApplicationController
  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.includes(:sandwich).order("id desc")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @orders }
      format.js
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @order = Order.find(params[:id])
    #@sandwich = Sandwich.where("id =?", @order.sandwich_id)
    @sandwich = @order.sandwich

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/new
  # GET /orders/new.json
  def new
    @sandwich = Sandwich.find(params[:sandwich_id]) 
    #@order = @sandwich.build

    @order = Order.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @order }
      format.js
    end
  end

  def create
    @sandwich = Sandwich.find(params[:sandwich_id])    
    @order = @sandwich.orders.create(params[:order])
    #@order = Order.new(params[:order])

    respond_to do |format|
      if @order.save
        #format.html {redirect_to [@sandwich, @order], notice: 'Order was successfully created.'}
        format.html {redirect_to orders_path, notice: 'Your order has been transmitted to the SandwichMaker and will be delivered soon!'}
        format.json { render json: @order, status: :created, location: @order }
      else
        format.html { render action: "new" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end



  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])
  end


  # PUT /orders/1
  # PUT /orders/1.json
  def update
    @order = Order.find(params[:id])

    respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end
end
