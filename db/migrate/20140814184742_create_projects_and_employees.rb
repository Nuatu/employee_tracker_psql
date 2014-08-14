 class CreateProjectsAndEmployees < ActiveRecord::Migration
  def change
    create_table :projects_and_employees do |t|
      t.belongs_to :project
      t.belongs_to :employee
    end
  end
end
