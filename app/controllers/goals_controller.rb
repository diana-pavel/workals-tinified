class GoalsController < ApplicationController
  before_action :authenticate_user!
  #skip_after_action :verify_policy_scoped, :only => :index

  #GET /goals
  #GET /goals.json
  def all
    @goals = Goal.all
    authorize @goals
  end

  def index
    @goals = current_user.goals
  end

  # GET /goals/1
  # GET /goals/1.json
  def show
    @goal = Goal.find(params[:id])
    authorize @goal
  end

  # GET /goals/new
  def new
    @user = current_user
    @goal = Goal.new
    authorize @goal
  end

  def create
    @goal = current_user.goals.create(goal_params)
    authorize @goal
    redirect_to goals_path
  end
  # GET /goals/1/edit
  def edit
    @goal = current_user.goals.find(params[:id])
    authorize @goal
  end

  # POST /goals
  # POST /goals.json

  # PATCH/PUT /goals/1
  # PATCH/PUT /goals/1.json
  def update
    respond_to do |format|
      if @goal.update(goal_params)
        format.html { redirect_to @goal, notice: 'Goal was successfully updated.' }
        format.json { render :show, status: :ok, location: @goal }
      else
        format.html { render :edit }
        format.json { render json: @goal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /goals/1
  # DELETE /goals/1.json
  def destroy
    @goal = current_user.goals.find(params[:id])
    authorize @goal
    @goal.destroy
    respond_to do |format|
      format.html { redirect_to goals_url, notice: 'Goal was successfully deleted.' }
      format.json { head :no_content }
    end
  end

private

    # Use callbacks to share common setup or constraints between action

    # Only allow a list of trusted parameters through.
    def goal_params
      params.require(:goal).permit(:goal, :description)
    end
end
