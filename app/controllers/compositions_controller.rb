class CompositionsController < ApplicationController
  before_action :authenticate_user! , only: [:new, :create, :edit, :update, :destroy]
  before_action :set_composition, only: [:show, :edit, :update, :destroy]

  @@flag_composition_used = 1

  def index
    @compositions = Composition.all
  end

  def new
    @composition = Composition.new
  end

  def create
    @composition = Composition.new(composition_params)
    @composition.user = current_user

    respond_to do |format|
      if @composition.save
        format.html { redirect_to composition_path(@composition), notice: 'composition index was successfully created.' }
        format.json { render :show, status: :created, location: @composition }
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
        format.html { redirect_to composition_path(@composition), notice: 'composition index was successfully updated.' }
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
        format.html { redirect_to compositions_path, notice: 'composition index was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to compositions_path, alert: 'Can not deleted.Please delete the writings first.' }
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

  def require_is_admin
    if !current_user.admin?
      flash[:alert] = 'You are not admin'
      redirect_to root_path
    end
  end

end
