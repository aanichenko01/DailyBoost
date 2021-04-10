class LoggedWorkoutsController < ApplicationController
  before_action :set_logged_workout, only: %i[ show edit update destroy ]
<<<<<<< Updated upstream
  # Page can only be accessed if user is logged in
  before_action :authenticate_user!

  # GET /logged_workouts or /logged_workouts.json
  def index
    @logged_workouts = LoggedWorkout.user_logged_workouts(current_user).order(params[:sort])
  end

  def calendar
    
    @logged_workouts = LoggedWorkout.user_logged_workouts(current_user).order(params[:sort])
  end

  def achievements
   
    @logged_workouts = LoggedWorkout.user_logged_workouts(current_user).order(params[:sort])
    
 end

=======

  # GET /logged_workouts or /logged_workouts.json
  def index
    @logged_workouts = LoggedWorkout.all
  end

>>>>>>> Stashed changes
  # GET /logged_workouts/1 or /logged_workouts/1.json
  def show
  end

<<<<<<< Updated upstream

=======
>>>>>>> Stashed changes
  # GET /logged_workouts/new
  def new
    @logged_workout = LoggedWorkout.new
  end

  # GET /logged_workouts/1/edit
  def edit
  end

  # POST /logged_workouts or /logged_workouts.json
  def create
    @logged_workout = LoggedWorkout.new(logged_workout_params)
<<<<<<< Updated upstream
    @logged_workout.user = current_user
=======
>>>>>>> Stashed changes

    respond_to do |format|
      if @logged_workout.save
        format.html { redirect_to @logged_workout, notice: "Logged workout was successfully created." }
        format.json { render :show, status: :created, location: @logged_workout }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @logged_workout.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /logged_workouts/1 or /logged_workouts/1.json
  def update
    respond_to do |format|
      if @logged_workout.update(logged_workout_params)
        format.html { redirect_to @logged_workout, notice: "Logged workout was successfully updated." }
        format.json { render :show, status: :ok, location: @logged_workout }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @logged_workout.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /logged_workouts/1 or /logged_workouts/1.json
  def destroy
    @logged_workout.destroy
    respond_to do |format|
      format.html { redirect_to logged_workouts_url, notice: "Logged workout was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_logged_workout
      @logged_workout = LoggedWorkout.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def logged_workout_params
<<<<<<< Updated upstream
      params.require(:logged_workout).permit(:name, :start_time, :user_id)
=======
      params.require(:logged_workout).permit(:name, :start_time)
>>>>>>> Stashed changes
    end
end
