class ChangeTypeNote < ActiveRecord::Migration[5.0]
  def up
    change_table :qualifications do |t|
      t.change :nota, :decimal
    end
  end

  def down
    change_table :qualifications do |t|
      t.change :nota, :integer
    end
  end
end
