class ObrasController < ApplicationController
  def index
    @obras = Obra.order(:nombre)
  end

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

  def obras_por_arquitecto
    arquitecto_id = params[:arquitecto_id]
    obras = Obra.where(arquitecto_id: arquitecto_id)

    render json: { obras: obras }
  end

  private
  def obra_params
    params.require(:obra).permit(:nombre, :arquitecto_id, :estado)
  end
end
