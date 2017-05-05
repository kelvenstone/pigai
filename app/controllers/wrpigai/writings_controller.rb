class Wrpigai::WritingsController < ApplicationController
  before_action :authenticate_user! , only: [:index]


  def index
    @writings = Writing.all.order("created_at DESC")
  end

end
