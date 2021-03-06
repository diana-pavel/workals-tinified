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
    @company = current_user.companies.find(params[:id])
    authorize @company
  end

  # POST /companies or /companies.json
   def create
    @company = current_user.companies.create(company_params)
    authorize @company
    redirect_to companies_path
  end

  # PATCH/PUT /companies/1 or /companies/1.json
  def update
    @company = current_user.companies.find(params[:id])
    authorize @company
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
    @company = Company.find(params[:id])
    authorize @company
    @company.destroy

    respond_to do |format|
      format.html { redirect_to companies_url }
      format.json { head :no_content }
    end
  end

  private

    # Only allow a list of trusted parameters through.

    def company_params
      params.require(:company).permit(:name, :id, :title, :link)
    end
end
