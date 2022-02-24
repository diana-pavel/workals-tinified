class GoalsController < ApplicationController
before_action :authenticate_user!
skip_after_action :verify_policy_scoped, :only => :index

 def all
    @goals = Goal.all

  end

 def index
    @goals = current_user.goals
  end

  def show
  end

  # GET /companies/new
  def new
    @user = current_user
    @goal = Goal.new
    authorize @goal
  end

  # GET /companies/1/edit
  def edit
  end

  # POST /companies or /companies.json
  def create
      @goal = current_user.goals.create(goal_params)
    authorize @goal

    respond_to do |format|
      if @goal.save
        format.html { redirect_to goal_url(@goal), notice: "Goal was successfully created." }
        format.json { render :show, status: :created, location: @goal }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @goal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /companies/1 or /companies/1.json
  def update
    respond_to do |format|
      if @goal.update(goal_params)
        format.html { redirect_to goal_url(@goal), notice: "Goal was successfully updated." }
        format.json { render :show, status: :ok, location: @goal }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @goal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1 or /companies/1.json
  def destroy
    @goal.destroy

    respond_to do |format|
      format.html { redirect_to goal_url, notice: "Goal was successfully deleted." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_goal
      @goal = Goal.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def goal_params
      params.require(:goal).permit(:goal, :description, :user_id)
    end
end
