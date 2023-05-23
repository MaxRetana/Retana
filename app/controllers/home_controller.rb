class HomeController < ApplicationController
  def index
    @anticipos = Anticipo.all
  end
end
