class HomeController < ApplicationController
  def index
    @schools = School.all
  end
end
