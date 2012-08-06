class HolesController < ApplicationController
  # GET /holes
  # GET /holes.json
  def index
    begin
      set_club_id
      set_course_id
      
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
      set_club_id
      set_course_id
    
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
      set_club_id
      set_course_id
    
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
      set_club_id
      set_course_id
      
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
      set_club_id
      set_course_id
      
      @hole = Hole.new(params[:hole])
      raise if @hole.nil?
      if params[:club_id]
        @hole.course = Course.find(params[:course_id])
      end
      respond_to do |format|
        if @hole.save
          format.html { redirect_to club_course_holes_path(@club_id, @course_id), notice: 'Hole was successfully created.' }
          format.json { render json: @hole, status: :created, location: @hole }
        else
          format.html { render action: "new" }
          format.json { render json: @hole.errors, status: :unprocessable_entity }
        end
      end
    rescue
      render :layout => 'error', :template => 'errors/error'
    end
  end

  # PUT /holes/1
  # PUT /holes/1.json
  def update
    begin
      set_club_id
      set_course_id
      
      @hole = Hole.find(params[:id])
      raise if @hole.nil?
      
      respond_to do |format|
        if @hole.update_attributes(params[:hole])
          format.html { redirect_to club_course_hole_path(@club_id, @course_id, @hole), notice: 'Hole was successfully updated.' }
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
      set_club_id
      set_course_id
      
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
  def set_club_id
    @club_id = params[:club_id] if params[:club_id]
    raise if @club_id.nil?
  end
 
  def set_course_id
    @course_id = params[:course_id] if params[:course_id]
    raise if @course_id.nil?
  end
end
