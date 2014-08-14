
require 'spec_helper'

describe Employee do
  it 'can initialize employee object' do
    test_employee = Employee.new(ATTRIBUTES)
    test_employee.save
    expect(test_employee).to be_a Employee
    expect(test_employee.name).to eq 'default_name'
  end

  it 'employee belongs to a division' do
    division = Division.create(ATTRIBUTES)
    employee = Employee.create({:name => "sterling", :division_id => division.id})
    expect(employee.division).to eq division
  end
end
