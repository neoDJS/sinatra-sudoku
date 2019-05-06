require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

# run CoursesController.new
use Rack::MethodOverride
use BoxesController
use SudokuController
use UsersController
run ApplicationController