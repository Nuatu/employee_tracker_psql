require 'spec_helper'

describe 'Project' do
  it 'can initialize project object' do
    test_project = Project.create(ATTRIBUTES)
    expect(test_project).to be_a Project
    expect(test_project.name).to eq 'default_name'
  end

  it 'can list many projects' do
    project = Project.create(ATTRIBUTES)
    project1 = Project.create(ATTRIBUTES)
    project2 = Project.create(ATTRIBUTES)
    expect(Project.all).to eq [project, project1, project2]
  end

  it 'can list employees assigned to a project' do
    division = Division.create(ATTRIBUTES)
    employee = Employee.create({:name => "sterling", :division_id => division.id})
    employee1 = Employee.create({:name => "nuatu", :division_id => division.id})
    employee2 = Employee.create({:name => "andrew", :division_id => division.id})
    project = employee.projects.create(ATTRIBUTES)
    project1 = Project.create(ATTRIBUTES)
    project2 = Project.create(ATTRIBUTES)

    employee1.projects << project
    employee2.projects << project

    employee1.projects << project2
    employee2.projects << project2
# binding.pry
    expect(project.employees.each.map { |emp| emp.name }).to eq ["sterling", "nuatu", "andrew"]
    expect(project2.employees.each.map { |emp| emp.name }).to eq ["nuatu", "andrew"]
  end
end

