class DosesController < ApplicationController

  before_action :set_dose, only: [:destroy]

  def new           # GET /dose/new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create        # POST /dose
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.create(dose_params)
    @dose.cocktail = @cocktail
    @dose.save

    # no need for app/views/dose/create.html.erb
    redirect_to cocktail_path(@cocktail)
  end

  def destroy
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end


  private

  def set_dose
    @dose = Dose.find(params[:id])
  end
  def dose_params
    # *Strong params*: You need to *whitelist* what can be updated by the user
    # Never trust user data!
    params.require(:dose).permit(:description, :ingredient_id)
  end
end

