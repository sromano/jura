# encoding: utf-8
class InscriptionsController < ApplicationController
  layout "inscriptions"
  before_filter :load_graduate, :load_formulas, only: [:new, :create]
  before_filter :load_swear, only: [:index, :verify,:new, :create]
  before_filter :check_quota, only: [:verify, :new, :create]

  def verify
    @no_title = params[:no_title].present?
  end

  def show
    @inscription = Inscription.find(params[:id])
    if @inscription.closed?
      flash[:error] = "Estás inscripto para una jura que ya ha sido realizada"
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
    @swear = Swear.open.default_order.first
  end

  def load_graduate
    @graduate = Graduate.not_deleted.with_dni(params[:dni]).first
    unless @graduate
      redirect_to verify_inscriptions_path(no_title:true, dni: params[:dni])
    end

    if @inscription = @graduate.inscription
      flash[:success] = "Ya estás inscripto para una jura"
      redirect_to @inscription
    end
  end

  def check_quota
    if @swear.nil? || !@swear.free_quota?
      flash[:error] = "Lo sentimos, ya no hay más cupos libres para la jura"
      redirect_to root_path
    end
  end
end
