class Rating < ActiveRecord::Migration[5.0]
  def change
  	create_table :ratings do |t|
  		t.integer :score
  	end
  end
end
