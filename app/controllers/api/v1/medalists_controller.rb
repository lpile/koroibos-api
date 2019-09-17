class Api::V1::MedalistsController < ApplicationController
  def index
    @event = Event.find_by(id: params[:event_id])
    @medalists = @event.medalists
  end
end
