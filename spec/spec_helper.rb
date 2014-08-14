require 'active_record'
require 'rspec'
require 'shoulda-matchers'

ATTRIBUTES = {'name' => 'nuatu'}

require 'employee'
require 'division'

database_configurations = YAML::load(File.open('./db/config.yml'))
test_configuration = database_configurations['test']
ActiveRecord::Base.establish_connection(test_configuration)

RSpec.configure do |config|
  config.after(:each) do
    Employee.all.each { |employee| employee.destroy }
    Division.all.each { |division| division.destroy }
  end
end
