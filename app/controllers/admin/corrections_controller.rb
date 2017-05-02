class Admin::CorrectionsController < ApplicationController
  before_action :authenticate_user! , only: [:new, :create, :edit, :update, :destroy]


  def index
      @corrections = Correction.all.recent.paginate(:page => params[:page], :per_page => 8)
  end

  def show
    @correction = Correction.find(params[:id])
    @writing = @correction.writing
    @composition = @writing.composition
  end


  def destroy
    @correction = Correction.find(params[:id])
    @correction.destroy
    flash[:alert]="批改已经删除！"
    redirect_to admin_corrections_path
  end

  private
    def correction_params
      params.require(:correction).permit(:content)
    end


end
