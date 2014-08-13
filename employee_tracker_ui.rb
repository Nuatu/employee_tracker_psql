require 'active_record'
require './lib/employee'

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
    puts "Press '3' ----."
    puts "Press 'e' to Exit"
    choice = gets.chomp
    case choice
    when '1'
      add
    when '2'
      list
    when '3'
      # something
    when 'e'
      puts "Good-bye!"
    else
      puts "Sorry, that wasn't a valid option."
    end
  end
end

def add
  puts "Employee name to add?"
  employee_name = gets.chomp
  employee = Employee.new(:name => employee_name)
  employee.save
end

def list
  puts "Employees:"
  employees = Employee.all
  employees.each { |employee| puts employee.name }
end

welcome
