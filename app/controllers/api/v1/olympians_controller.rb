class Api::V1::OlympiansController < ApplicationController
  def index
    @olympians = Olympian.all
  end
end
