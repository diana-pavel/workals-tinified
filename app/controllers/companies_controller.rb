class CompaniesController < ApplicationController
  before_action :authenticate_user!
skip_after_action :verify_policy_scoped, :only => [:index, :show]

  # GET /companies or /companies.json

  def index
    @companies = Company.all
  end

  # GET /companies/1 or /companies/1.json
  def show
 @company = Company.find(params[:id])
  authorize @company
  end

  # GET /companies/new
  def new
    @user = current_user
    @company = Company.new
    authorize @company
  end

  # GET /companies/1/edit
  def edit
  end

  # POST /companies or /companies.json
   def create
    @company = current_user.companies.create(company_params)
    authorize @company
    redirect_to company_path
  end

  # PATCH/PUT /companies/1 or /companies/1.json
  def update
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to company_url(@company), notice: "Company was successfully updated." }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1 or /companies/1.json
  def destroy
    @company.destroy

    respond_to do |format|
      format.html { redirect_to companies_url, notice: "Company was successfully deleted." }
      format.json { head :no_content }
    end
  end

  private

    # Only allow a list of trusted parameters through.
   def set_company
   @company = Company.find(params[:id])
   end

    def company_params
      params.require(:company).permit(:name, :user_id, :title, :link)
    end
end
