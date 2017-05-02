class Wrpigai::CompositionsController < ApplicationController
  before_action :authenticate_user! , only: [:index]
  layout "side_grade"

  def index
    @compositions = Composition.all.order("created_at DESC")
  end


end
