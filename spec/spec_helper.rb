require 'active_record'
require 'rspec'
require 'shoulda-matchers'
# require 'pry'

ATTRIBUTES = {'name' => 'default_name'}

require 'employee'
require 'division'
require 'project'

database_configurations = YAML::load(File.open('./db/config.yml'))
test_configuration = database_configurations['test']
ActiveRecord::Base.establish_connection(test_configuration)

RSpec.configure do |config|
  config.before(:each) do
    Employee.all.each { |employee| employee.destroy }
    Division.all.each { |division| division.destroy }
    Project.all.each { |project| project.destroy }
  end
end
