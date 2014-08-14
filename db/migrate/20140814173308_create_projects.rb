class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.column :name, :string
      t.column :start_date, :datetime
      t.column :end_date, :datetime

      t.timestamps
    end
  end
end
