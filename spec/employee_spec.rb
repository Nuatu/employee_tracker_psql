require 'spec_helper'

describe Employee do
  it 'can initialize employee object' do
    test_employee = Employee.new(ATTRIBUTES)
    test_employee.save
    expect(test_employee).to be_a Employee
    expect(test_employee.name).to eq 'nuatu'
  end
end
