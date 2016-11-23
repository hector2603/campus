class AddReferenceToCourse < ActiveRecord::Migration[5.0]
  def change
  	add_reference(:courses, :users, index: { name: "profesor" })
  end
end
