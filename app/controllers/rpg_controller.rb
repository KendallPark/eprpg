class RpgController < ApplicationController
  def index
  end
  
  def fight
    @person1 = Programmer.find_by_name(params[:person1])
    @person2 = Programmer.find_by_name(params[:person2])
  end
end
