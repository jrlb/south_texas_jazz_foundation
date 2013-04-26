class BiographiesController < ApplicationController
  before_filter :authenticate_member!, :except => [:index, :show]

  # GET /biographies
  # GET /biographies.json
  def index
    @presenter = BioPresenter.new

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @biographies }
    end
  end

  # GET /biographies/1
  # GET /biographies/1.json
  def show
    @biography = Biography.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @biography }
    end
  end

  # GET /biographies/new
  # GET /biographies/new.json
  def new
    @biography = Biography.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @biography }
    end
  end

  # GET /biographies/1/edit
  def edit
    @biography = Biography.find(params[:id])
  end

  # POST /biographies
  # POST /biographies.json
  def create
    @biography = Biography.new(params[:biography])

    respond_to do |format|
      if @biography.save
        format.html { redirect_to @biography, notice: 'Biography was successfully created.' }
        format.json { render json: @biography, status: :created, location: @biography }
      else
        format.html { render action: "new" }
        format.json { render json: @biography.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /biographies/1
  # PUT /biographies/1.json
  def update
    @biography = Biography.find(params[:id])

    respond_to do |format|
      if @biography.update_attributes(params[:biography])
        format.html { redirect_to @biography, notice: 'Biography was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @biography.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /biographies/1
  # DELETE /biographies/1.json
  def destroy
    @biography = Biography.find(params[:id])
    @biography.destroy

    respond_to do |format|
      format.html { redirect_to biographies_url }
      format.json { head :no_content }
    end
  end
end
