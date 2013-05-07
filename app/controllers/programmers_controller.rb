class ProgrammersController < ApplicationController
  respond_to :json

  def index
    respond_with Programmer.all
  end

  def show
    respond_with Programmer.find(params[:id])
  end

  def create
    respond_with Programmer.create(params[:programmer])
  end

  def update
    respond_with Programmer.update(params[:id], params[:programmer])
  end

  def destroy
    respond_with Programmer.destroy(params[:id])
  end
end
