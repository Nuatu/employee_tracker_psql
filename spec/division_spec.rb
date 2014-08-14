require 'spec_helper'

describe 'Division' do
  it 'can initialize division object' do
    test_division = Division.create(ATTRIBUTES)
    expect(test_division).to be_a Division
    expect(test_division.name).to eq 'default_name'
  end

  it 'can list many divisions' do
    division = Division.create(ATTRIBUTES)
    division1 = Division.create(ATTRIBUTES)
    division2 = Division.create(ATTRIBUTES)
    expect(Division.all).to eq [division, division1, division2]
  end

  it 'lists employees in a division' do
    division = Division.create(ATTRIBUTES)
    employee = Employee.create({:name => "sterling", :division_id => division.id})
    employee1 = Employee.create({:name => "nuatu", :division_id => division.id})
    employee2 = Employee.create({:name => "andrew", :division_id => division.id})
    expect(division.employees).to eq [employee, employee1, employee2]
    expect(division.employees.each.map { |emp| emp.name }).to eq ["sterling", "nuatu", "andrew"]
  end
end
