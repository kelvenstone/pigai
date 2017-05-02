class Admin::CompositionsController < ApplicationController
  before_action :authenticate_user! , only: [:new, :create, :edit, :update, :destroy]
  before_action :set_composition, only: [:show, :edit, :update, :destroy]

  def index
    @compositions = Composition.all.recent.paginate(:page => params[:page], :per_page => 6)
  end

  def new
    @composition = Composition.new

  end

  def create
    @composition = Composition.new(composition_params)
    @composition.user = current_user

    respond_to do |format|
      if @composition.save
        format.html { redirect_to admin_composition_path(@composition), notice: 'my composition  was successfully created.' }
        format.json { render admin: :show, status: :created, :location=>admin/@composition }
      else
        format.html { render :new }
        format.json { render json: @composition.errors, status: :unprocessable_entity }
      end
    end

  end

  def edit

  end

  def show

  end

  def update

    respond_to do |format|
      if @composition.update(composition_params)
        format.html { redirect_to admin_composition_path(@composition), notice: 'admin composition was successfully updated.' }
        format.json { render :show, status: :ok, location: @composition }
      else
        format.html { render :edit }
        format.json { render json: @composition.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if @composition.writings.count == 0
      @composition.destroy
      respond_to do |format|
        format.html { redirect_to admin_compositions_path, notice: 'composition admin was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to admin_compositions_path, alert: 'Can not deleted.Please delete the writings first.' }
        format.json { head :no_content }
      end
    end
  end


  private

  def set_composition
    @composition = Composition.find(params[:id])
  end

  def composition_params
    params.require(:composition).permit(:grade, :com_title, :content)
  end


end
