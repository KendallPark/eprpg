class Programmer < ActiveRecord::Base
  attr_accessible :name, :hp, :tallness, :l337n355, :swag, :caffeination
  
  def to_s
    name
  end
end