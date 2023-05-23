class ArquitectosController < ApplicationController
  def new
    @arquitecto = Arquitecto.new
  end
  
  def create
    @arquitecto = Arquitecto.new(arquitecto_params)
    if @arquitecto.save
      redirect_to home_index_path
    else
      render 'new'
    end
  end

  private
  def arquitecto_params
    params.require(:arquitecto).permit(:nombre)
  end
end
