class Account::CorrectionsController < ApplicationController
  before_action :authenticate_user! , only: [:new, :create, :edit, :update, :destroy]
  layout "side_grade"

  def index
      @corrections = current_user.corrections.recent.paginate(:page => params[:page], :per_page => 8)
  end

  def show
    @correction = Correction.find(params[:id])
    @writing = @correction.writing
    @composition = @writing.composition
  end

  def edit
    @correction = Correction.find(params[:id])
    @writing = @correction.writing
    @composition = @writing.composition
  end

  def update
    @correction = Correction.find(params[:id])
    if @correction.update(correction_params)
      redirect_to account_corrections_path, notice: "我的批改已经更新"
    else
      render :edit
    end
  end

  def destroy
    @correction = Correction.find(params[:id])
    @correction.destroy
    flash[:alert]="我的批改已经删除！"
    redirect_to account_corrections_path
  end

  private
    def correction_params
      params.require(:correction).permit(:content)
    end


end
