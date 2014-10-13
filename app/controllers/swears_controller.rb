# encoding: utf-8
class SwearsController < ApplicationController
  before_action :authenticate_operator!
  before_filter :load_swear, only:[:edit,:show,:update]
  layout "admin"

  def new
    @swear = Swear.new
  end

  def edit
    render action: "new"
  end

  def show
    @inscriptions = @swear.inscriptions.includes(:graduate,:formula)
  end

  def update
    if @swear.update_attributes(swear_params)
      flash[:success] = "Jura actualizada"
      redirect_to swears_path
    else
      render action: "new"
    end
  end

  def create
    @swear = Swear.new(swear_params)
    if @swear.save
      flash[:success] = "Jura creada"
      redirect_to swears_path
    else
      render action: "new"
    end
  end

  def index
    @swears = Swear.all.order("swear_date DESC").limit(12)
  end

  private

  def load_swear
    @swear = Swear.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:error] = "La jura no se econtró"
    redirect_to swears_path
    return false
  end

  def swear_params
    params.require(:swear).permit("quota", "enabled",
      "inscription_date(1i)", "inscription_date(2i)","inscription_date(3i)",
      "swear_date(1i)","swear_date(2i)","swear_date(3i)")
  end
end
