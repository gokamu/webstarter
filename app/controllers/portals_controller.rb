class PortalsController < ApplicationController
  before_action :set_portal, only: [:show, :edit, :update, :destroy]

  def show
    @school = School.find(params[:id])
    @portal = Portal.find(params[:id])
    courses = Course.all
    @courselist = @portal.courses
  end

  def new
    @portal = Portal.new
    @school = School.find(params[:id])
  end

  # GET /portals/1/edit
  def edit
  end

  # POST /portals
  # POST /portals.json
  def create
    @portal = Portal.new(portal_params)
    if @portal.save
      redirect_to "/admin"
    else
      render :new
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_portal
    @portal = Portal.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def portal_params
    params.require(:portal).permit(:name, :school_id)
  end
end
