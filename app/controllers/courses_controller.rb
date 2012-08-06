class CoursesController < ApplicationController
  # GET /courses
  # GET /courses.json
  def index
    begin
      @club = Club.find(params[:club_id])
      raise if @club.nil?
      
      conditions = ["club_id = ?",@club.id]
      @courses = Course.find(:all, :conditions => conditions)
      
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @courses }
      end
    rescue
      render :layout => 'error', :template => 'errors/error'
    end
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
    begin
      set_club_id
      
      @course = Course.find(params[:id])
      raise if @course.nil?
      
      conditions = ["course_id = ?",@course.id]
      @holes = Hole.find(:all, :conditions => conditions)
    
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @course }
      end
    rescue
      render :layout => 'error', :template => 'errors/error'
    end
  end

  # GET /courses/new
  # GET /courses/new.json
  def new
    begin
      set_club_id
      
      @course = Course.new
    
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @course }
      end
    rescue
      render :layout => 'error', :template => 'errors/error'
    end
  end

  # GET /courses/1/edit
  def edit
    begin
      @course = Course.find(params[:id])
      raise if @course.nil?
    rescue
      render :layout => 'error', :template => 'errors/error'
    end
  end

  # POST /courses
  # POST /courses.json
  def create
    begin
      set_club_id
      
      @course = Course.new(params[:course])
      if params[:club_id]
        @course.club = Club.find(params[:club_id])
      end
      
      respond_to do |format|
        if @course.save
          format.html { redirect_to :controller => 'courses', :action => 'show', :club_id => @club_id, :id => @course.id, notice: 'Course was successfully created.' }
          format.json { render json: @course, status: :created, location: @course }
        else
          format.html { render action: "new" }
          format.json { render json: @course.errors, status: :unprocessable_entity }
        end
      end
    rescue
      render :layout => 'error', :template => 'errors/error'
    end
  end

  # PUT /courses/1
  # PUT /courses/1.json
  def update
    begin
      @course = Course.find(params[:id])
      raise if @course.nil?
      
      respond_to do |format|
        if @course.update_attributes(params[:course])
          format.html { redirect_to club_courses_path, notice: 'Course was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @course.errors, status: :unprocessable_entity }
        end
      end
    rescue
      render :layout => 'error', :template => 'errors/error'
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    begin
      @course = Course.find(params[:id])
      raise if @course.nil?
      
      @course.destroy

      respond_to do |format|
        format.html { redirect_to club_courses_path }
        format.json { head :no_content }
      end
    rescue
      render :layout => 'error', :template => 'errors/error'
    end
  end
  
  private
  def set_club_id
    @club_id = params[:club_id] if params[:club_id]
    raise if @club_id.nil?
  end
end
