class AddReferenceToCourse < ActiveRecord::Migration[5.0]
  def change
  	change_table :courses do |t|
  		t.references :user, index: true
      end
  end
end
