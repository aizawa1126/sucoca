class HolesController < ApplicationController
  before_filter :set_club, :set_course

  # GET /holes
  # GET /holes.json
  def index
    begin
      @holes = Hole.all
      
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @holes }
      end
    rescue
      render :layout => 'error', :template => 'errors/error'
    end
  end

  # GET /holes/1
  # GET /holes/1.json
  def show
    begin
      @hole = Hole.find(params[:id])
      raise if @hole.nil?
      
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @hole }
      end
    rescue
      render :layout => 'error', :template => 'errors/error'
    end
  end

  # GET /holes/new
  # GET /holes/new.json
  def new
    begin
      @hole = Hole.new
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @hole }
      end
    rescue
      render :layout => 'error', :template => 'errors/error'
    end
  end

  # GET /holes/1/edit
  def edit
    begin
      @hole = Hole.find(params[:id])
      raise if @hole.nil?
    rescue
      render :layout => 'error', :template => 'errors/error'
    end
  end

  # POST /holes
  # POST /holes.json
  def create
    begin
      @hole = Hole.new(params[:hole])
      @hole.course = @course

      respond_to do |format|
        if @hole.save
          format.html { redirect_to club_course_hole_path(@club, @course, @hole), notice: 'Hole was successfully created.' }
          format.json { render json: @hole, status: :created, location: @hole }
        else
          format.html { render action: "new" }
          format.json { render json: @hole.errors, status: :unprocessable_entity }
        end
      end
    rescue
      #render :layout => 'error', :template => 'errors/error'
    end
  end

  # PUT /holes/1
  # PUT /holes/1.json
  def update
    begin
      @hole = Hole.find(params[:id])
      raise if @hole.nil?
      
      respond_to do |format|
        if @hole.update_attributes(params[:hole])
          format.html { redirect_to club_course_hole_path(@club, @course, @hole), notice: 'Hole was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @hole.errors, status: :unprocessable_entity }
       end
      end
    rescue
      render :layout => 'error', :template => 'errors/error'
    end
  end

  # DELETE /holes/1
  # DELETE /holes/1.json
  def destroy
    begin
      @hole = Hole.find(params[:id])
      raise if @hole.nil?
      
      @hole.destroy

      respond_to do |format|
        format.html { redirect_to club_course_holes_url }
        format.json { head :no_content }
      end
    rescue
      render :layout => 'error', :template => 'errors/error'
    end
  end
  
  
  private
  def set_club
    if params[:club_id]
      @club = Club.find(params[:club_id])
      raise if @club.nil?
    else
      raise
    end
  end
 
  def set_course
    if params[:course_id]
      @course = Course.find(params[:course_id])
      raise if @course.nil?
    else
      raise
    end
  end
end
