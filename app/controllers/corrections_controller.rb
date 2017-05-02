class CorrectionsController < ApplicationController
  before_action :authenticate_user! , only: [:new, :create, :edit, :update, :destroy]
  layout "side_grade"

  def index
    @writing = Writing.find(params[:writing_id])
    @corrections = @writing.corrections.order("created_at DESC")
  end
  
  def new
    @writing = Writing.find(params[:writing_id])
    @composition = @writing.composition
    @correction = Correction.new
  end

  def create
    @writing = Writing.find(params[:writing_id])
    @composition = @writing.composition
    @correction = Correction.new(correction_params)
    @correction.user = current_user
    @correction.writing = @writing
    respond_to do |format|
      if @correction.save
        format.html { redirect_to [@writing, @correction], notice: 'correction was successfully created.' }
        format.json { render :show, status: :created, location: @@correction }
      else
        format.html { render :new }
        format.json { render json: @correction.errors, status: :unprocessable_entity }
      end
    end
  end

  def show

    @correction = Correction.find(params[:id])
    @writing = @correction.writing
    @composition = @writing.composition

  end


  private
    def correction_params
      params.require(:correction).permit(:content)
    end

end
