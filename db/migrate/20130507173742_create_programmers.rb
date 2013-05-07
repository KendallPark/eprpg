class CreateProgrammers < ActiveRecord::Migration
  
  def change
    create_table :programmers do |t|
      t.string :name
      t.integer :hp
      t.integer :tallness
      t.integer :l337n355
      t.integer :swag
      t.integer :caffeination
      
      t.timestamps
    end
  end
  
end
