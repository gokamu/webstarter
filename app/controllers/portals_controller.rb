class PortalsController < ApplicationController
  def show
    @school = School.find(params[:id])
    @portal = Portal.find(params[:id])
  end
end
