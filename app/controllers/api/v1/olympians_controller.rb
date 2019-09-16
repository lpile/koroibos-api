class Api::V1::OlympiansController < ApplicationController
  def index
    if params[:age]
      @olympian = Olympian.request_age(params[:age])
    else
      @olympians = Olympian.all
    end
  end
end
