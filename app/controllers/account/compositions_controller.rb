class Account::CompositionsController < ApplicationController
  before_action :authenticate_user! , only: [:new, :create, :edit, :update, :destroy]
  before_action :set_composition, only: [:show, :edit, :update, :destroy]



  def index

  end

  def woyaowrite
    @compositions = Composition.all.order("created_at DESC")
    redirect_to render:index
  end
end
