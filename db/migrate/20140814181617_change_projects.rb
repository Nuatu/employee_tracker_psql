class ChangeProjects < ActiveRecord::Migration
  def change
    change_table :projects do |t|
      t.column :employee_id, :int
    end
  end
end
