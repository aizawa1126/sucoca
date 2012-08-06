class ClubsController < ApplicationController
  # GET /clubs
  # GET /clubs.json
  def index
    begin
      @clubs = Club.all

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @clubs }
      end
    rescue
      render :layout => 'error', :template => 'errors/error'
    end
  end

  # GET /clubs/1
  # GET /clubs/1.json
  def show
    begin
      @club = Club.find(params[:id])
      #raise "test" if @club.nil?
      raise if @club.nil?
      conditions = ["club_id = ?",@club.id]
      @courses = Course.find(:all, :conditions => conditions)
      
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @club }
      end
    rescue
      render :layout => 'error', :template => 'errors/error'
    end
  end

  # GET /clubs/new
  # GET /clubs/new.json
  def new
    begin
      @club = Club.new

      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @club }
      end
    rescue
      render :layout => 'error', :template => 'errors/error'
    end
  end

  # GET /clubs/1/edit
  def edit
    begin
      @club = Club.find(params[:id])
      raise if @club.nil?
    rescue
      render :layout => 'error', :template => 'errors/error'
    end
  end

  # POST /clubs
  # POST /clubs.json
  def create
    begin
      @club = Club.new(params[:club])
      raise if @club.nil?
      
      respond_to do |format|
        if @club.save
          format.html { redirect_to @club, notice: 'Club was successfully created.' }
          format.json { render json: @club, status: :created, location: @club }
        else
          format.html { render action: "new" }
          format.json { render json: @club.errors, status: :unprocessable_entity }
        end
      end
    rescue
      render :layout => 'error', :template => 'errors/error'
    end
  end

  # PUT /clubs/1
  # PUT /clubs/1.json
  def update
    begin
      @club = Club.find(params[:id])
      raise if @club.nil?
      respond_to do |format|
        if @club.update_attributes(params[:club])
          format.html { redirect_to @club, notice: 'Club was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @club.errors, status: :unprocessable_entity }
        end
      end
    rescue
      render :layout => 'error', :template => 'errors/error'
    end
  end

  # DELETE /clubs/1
  # DELETE /clubs/1.json
  def destroy
    begin
      @club = Club.find(params[:id])
      raise if @club.nil?
      @club.destroy

      respond_to do |format|
        format.html { redirect_to clubs_url }
        format.json { head :no_content }
      end
    rescue
      render :layout => 'error', :template => 'errors/error'
    end
  end
end
