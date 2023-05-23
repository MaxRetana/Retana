class ObrasController < ApplicationController
  def new
    @obra = Obra.new
    @arquitectos = Arquitecto.all
  end
  
  def create
    @obra = Obra.new(obra_params)
    if @obra.save
      redirect_to home_index_path
    else
      render 'new'
    end
  end

  private
  def obra_params
    params.require(:obra).permit(:nombre, :arquitecto_id, :estado)
  end
end
