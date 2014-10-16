class GraduatesController < ApplicationController
  before_action :authenticate_operator!, only: [:upload, :do_upload]
  layout "admin", only: [:upload]

  def index
    @graduates = Graduate.not_deleted.order("last_name,first_name").all
  end

  def do_upload
    importer = SpreadsheetImporter.new params[:file]
    importer.process
    redirect_to action:"index"
  rescue NoMethodError
    flash[:error] = "No se pudo cargar el archivo"
    redirect_to action: "upload"
  end
end
