class CocktailsController < ApplicationController
  def index         # GET /cocktails
    @cocktails = Cocktail.all
  end

  def show          # GET /cocktails/:id
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new
    # @review = Review.new
  end

  def new           # GET /cocktails/new
    @cocktail = Cocktail.new
  end

  def create        # POST /cocktails
    @cocktail = Cocktail.new(cocktail_params)
    @cocktail.save

    # no need for app/views/cocktails/create.html.erb
    redirect_to cocktail_path(@cocktail)
  end

  # def edit          # GET /cocktails/:id/edit
  #   @cocktail = Cocktail.find(params[:id])
  # end

  # def update        # PATCH /cocktails/:id
  #   @cocktail = Cocktail.find(params[:id])
  #   @cocktail.update(cockatil_params)

  #   # no need for app/views/cocktails/create.html.erb
  #   redirect_to cocktail_path(@cocktail)
  # end

  # def destroy       # DELETE /cocktails/:id
  #   @cocktail = Cocktail.find(params[:id])
  #   @cocktail.destroy

  #   # no need for app/views/cocktails/create.html.erb
  #   redirect_to cocktails_path
  # end

  private

  def cocktail_params
    # *Strong params*: You need to *whitelist* what can be updated by the user
    # Never trust user data!
    params.require(:cocktail).permit(:name)
  end
end
