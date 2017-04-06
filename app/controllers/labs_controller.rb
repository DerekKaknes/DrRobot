class LabsController < ApplicationController
  def upload
    @lab = Lab.new_from_pdf(pdf_params[:pdf].tempfile)
  end

  def new
    @lab = Lab.new
  end

  private

  def pdf_params
    params.require(:lab).permit(:pdf)
  end
end
