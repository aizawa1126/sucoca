class ScorecardsController < ApplicationController
  before_filter :set_user
  before_filter :authenticate

  def set_user
    @user = session[:login]
  end

  def add_player
    set_user

    conditions = ["user_id = ?",@user.id]
    @parties = Party.find(:all, :conditions => conditions)

    @scorecards = []
    @parties.each do |party|
      @scorecards << Scorecard.find(party.scorecard_id)
    end

    @courses = {}
    @scorecards.each do |scorecard|
      id = scorecard.course_id
      @courses[id] = Course.find(id)
    end

    @clubs = {}
    @courses.each do |key, course|
      id = course.club_id
      @clubs[id] = Club.find(id)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @scorecards }
    end
  end

  # GET /scorecards
  # GET /scorecards.json
  def index
    set_user

    conditions = ["user_id = ?",@user.id]
    @parties = Party.find(:all, :conditions => conditions)

    @scorecards = []
    @parties.each do |party|
      @scorecards << Scorecard.find(party.scorecard_id)
    end

    @courses = {}
    @scorecards.each do |scorecard|
      id = scorecard.course_id
      @courses[id] = Course.find(id)
    end

    @clubs = {}
    @courses.each do |key, course|
      id = course.club_id
      @clubs[id] = Club.find(id)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @scorecards }
    end
  end

  # GET /scorecards/1
  # GET /scorecards/1.json
  def show
    @scorecard = Scorecard.find(params[:id])

    conditions = ["scorecard_id = ?",@scorecard.id]
    @parties = Party.find(:all, :conditions => conditions)

    @course = Course.find(@scorecard.course_id)
    @club = Club.find(@course.club_id)

    conditions = ["course_id = ?",@course.id]
    @holes = Hole.find(:all, :order => 'number', :conditions => conditions)

    @players = []
    @parties.each do |party|
      @players << User.find(party.user_id)
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @scorecard }
    end
  end

  # GET /scorecards/new
  # GET /scorecards/new.json
  def new
    @scorecard = Scorecard.new
    @party = Party.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @scorecard }
    end
  end

  # GET /scorecards/1/edit
  def edit
    @scorecard = Scorecard.find(params[:id])
  end

  # POST /scorecards
  # POST /scorecards.json
  def create
    set_user
    @scorecard = Scorecard.new(params[:scorecard])

    respond_to do |format|
      if @scorecard.save
        @party = Party.new
        @party.user_id = @user.id
        @party.scorecard_id = @scorecard.id
        @party.save
        format.html { redirect_to @scorecard, notice: 'Scorecard was successfully created.' }
        format.json { render json: @scorecard, status: :created, location: @scorecard }
      else
        format.html { render action: "new" }
        format.json { render json: @scorecard.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /scorecards/1
  # PUT /scorecards/1.json
  def update
    @scorecard = Scorecard.find(params[:id])

    respond_to do |format|
      if @scorecard.update_attributes(params[:scorecard])
        format.html { redirect_to @scorecard, notice: 'Scorecard was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @scorecard.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scorecards/1
  # DELETE /scorecards/1.json
  def destroy
    @scorecard = Scorecard.find(params[:id])
    @scorecard.destroy

    respond_to do |format|
      format.html { redirect_to scorecards_url }
      format.json { head :no_content }
    end
  end
end
