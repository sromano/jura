# encoding: utf-8
class InscriptionsController < ApplicationController
  layout "inscriptions"
  before_filter :load_swear, only: [:verify,:new, :create]
  before_filter :load_graduate, :load_formulas, :check_registered, only: [:new, :create]

  def index
    @swear = Swear.open.first
  end

  def verify
    @no_title = params[:no_title].present?
  end

  def show
    @inscription = Inscription.find(params[:id])
    if @inscription.expired?
      redirect_to root_path
    end
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end

  def new
    @inscription = Inscription.new
    @inscription.graduate = @graduate
    @inscription.swear = @swear
  end

  def create
    @inscription = Inscription.new(inscription_params)
    if @inscription.save
      redirect_to @inscription
    else
      render action: "new"
    end
  end

  private

  def inscription_params
    params.require(:inscription).permit("formula_id", "email","graduate_id", "swear_id")
  end

  def load_formulas
    @formulas = Formula.all
  end

  def load_swear
    @swear = Swear.available.first
    unless @swear
      flash[:error] = "Lo sentimos, ya no hay más cupos libres para la jura"
      redirect_to root_path
    end
  end

  def load_graduate
    @graduate = Graduate.where(dni:params[:dni]).first
    unless @graduate
      redirect_to verify_inscriptions_path(no_title:true, dni: params[:dni])
    end
  end

  def check_registered
    if @inscription = @swear.inscriptions.where(graduate_id: @graduate.id).first
      redirect_to @inscription
    end
  end
end
