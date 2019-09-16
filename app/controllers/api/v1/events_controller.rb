class Api::V1::EventsController < ApplicationController
  def index
    @sports = Sport.all
  end
end
