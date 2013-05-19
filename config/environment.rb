# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
TestSolution::Application.initialize!

Time::DATE_FORMATS[:ru_date] = "%d.%m.%Y %H:%M"
