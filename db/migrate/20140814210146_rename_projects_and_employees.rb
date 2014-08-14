class RenameProjectsAndEmployees < ActiveRecord::Migration
  def change
    rename_table :projects_and_employees, :employees_projects
  end
end
