class CreateQualifications < ActiveRecord::Migration[5.0]
  def change
    create_table :qualifications do |t|
      t.references :course, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :nota

      t.timestamps
    end
  end
end
