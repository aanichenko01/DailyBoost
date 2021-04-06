class WorkoutsController < ApplicationController
  include HTTParty
  before_action :set_workout, only: [:show, :edit, :update, :destroy]
  # Page can only be accessed if user is logged in
  before_action :authenticate_user!

  # GET /workouts
  # GET /workouts.json
  def index
    @workouts = Workout.user_workouts(current_user).order(params[:sort])
  end

  def search
      @workout_id = params[:workout_id]
      case params[:category]
      when "Abs"
        category = 10
      when "Arms"
        category = 8
      when "Back"
        category = 12
      when "Calves"
        category = 14
      when "Chest"
        category = 11
      when "Legs"
        category = 9
      when "Shoulders"
        category = 13
      end
      @response = get_exercise_by_category(category)
  end

  # GET /workouts/1
  # GET /workouts/1.json
  def show
  end

  # GET /workouts/new
  def new
    @workout = Workout.new
  end

  # GET /workouts/1/edit
  def edit
  end

  # POST /workouts
  # POST /workouts.json
  def create
    @workout = Workout.new(workout_params)
    @workout.user = current_user
    @workout.fitness_goal = params[:fitness_goal]

    respond_to do |format|
      if @workout.save
        format.html { redirect_to @workout, notice: I18n.t('workouts.created') }
        format.json { render :show, status: :created, location: @workout }
      else
        format.html { render :new }
        format.json { render json: @workout.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /workouts/1
  # PATCH/PUT /workouts/1.json
  def update

    respond_to do |format|
      if @workout.update(workout_params)
        format.html { redirect_to @workout, notice: I18n.t('workouts.updated')}
        format.json { render :show, status: :ok, location: @workout }
      else
        format.html { render :edit }
        format.json { render json: @workout.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workouts/1
  # DELETE /workouts/1.json
  def destroy
    @workout.destroy
    respond_to do |format|
      format.html { redirect_to workouts_url, notice: I18n.t('workouts.deleted') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_workout
      @workout = Workout.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def workout_params
      params.require(:workout).permit(:name, :duration, :fitness_goal)
    end

    def get_exercise_by_category(category)
      return HTTParty.get('https://wger.de/api/v2/exercise/?language=2&limit=500&category=' + category.to_s).parsed_response
    end
end
