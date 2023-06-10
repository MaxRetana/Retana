class HomeController < ApplicationController
  def index
    start_of_day = Time.zone.now.beginning_of_day
    end_of_day = Time.zone.now.end_of_day
    @anticipos = Anticipo.where(created_at: start_of_day..end_of_day).order(created_at: :desc)    
  end
end
