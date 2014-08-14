require 'active_record'
require './lib/employee'
require './lib/division'

database_configurations = YAML::load(File.open('./db/config.yml'))
development_configuration = database_configurations['development']
ActiveRecord::Base.establish_connection(development_configuration)

def welcome
  puts "Welcome to Employee Tracker!"
  menu
end

def menu
  choice = nil
  until choice == 'e'
    puts "Press '1' to add a employee."
    puts "Press '2' to list your employees."
    puts "Press '3' to add a division."
    puts "Press '4' to list your divisions."
    puts "Press 'e' to Exit"
    choice = gets.chomp
    case choice
    when '1'
      add_employee
    when '2'
      list_employee
    when '3'
      add_division
    when '4'
      list_division
    when 'e'
      puts "Good-bye!"
    else
      puts "Sorry, that wasn't a valid option."
    end
  end
end

def add_employee
  puts "Employee name to add?"
  employee_name = gets.chomp
  employee = Employee.new(:name => employee_name)
  employee.save
end

def list_employee
  puts "Employees:"
  employees = Employee.all
  employees.each { |employee| puts employee.name }
end

def add_division
  puts "Division to add?"
  division_name = gets.chomp
  division = Division.new(:name => division_name)
  division.save
end

def list_division
  puts "Divisions:"
  divisions = Division.all
  divisions.each { |division| puts division.name }
end

welcome
