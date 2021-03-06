class PressReleasesController < ApplicationController
  before_filter :authenticate_member!, except: [:index, :show]
  # GET /press_releases
  # GET /press_releases.json
  def index
    @press_releases = PressRelease.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @press_releases }
    end
  end

  # GET /press_releases/1
  # GET /press_releases/1.json
  def show
    @press_release = PressRelease.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @press_release }
    end
  end

  # GET /press_releases/new
  # GET /press_releases/new.json
  def new
    @press_release = PressRelease.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @press_release }
    end
  end

  # GET /press_releases/1/edit
  def edit
    @press_release = PressRelease.find(params[:id])
  end

  # POST /press_releases
  # POST /press_releases.json
  def create
    @press_release = PressRelease.new(params[:press_release])

    respond_to do |format|
      if @press_release.save
        format.html { redirect_to @press_release, notice: 'Press release was successfully created.' }
        format.json { render json: @press_release, status: :created, location: @press_release }
      else
        format.html { render action: 'new' }
        format.json { render json: @press_release.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /press_releases/1
  # PUT /press_releases/1.json
  def update
    @press_release = PressRelease.find(params[:id])

    respond_to do |format|
      if @press_release.update_attributes(params[:press_release])
        format.html { redirect_to @press_release, notice: 'Press release was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @press_release.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /press_releases/1
  # DELETE /press_releases/1.json
  def destroy
    @press_release = PressRelease.find(params[:id])
    @press_release.destroy

    respond_to do |format|
      format.html { redirect_to press_releases_url }
      format.json { head :no_content }
    end
  end
end
