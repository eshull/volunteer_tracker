require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/project')
require('./lib/volunteer')
require('pry')
require "pg"

DB = PG.connect({:dbname => 'volunteer_tracker'})


get ('/') do
  @projects = Project.all
  erb(:index)
end

post ('/') do

  project_name = params.fetch("new_project")
  new_project = Project.new({:title => project_name, :id => nil})
  new_project.save
  @projects = Project.all
  erb(:index)
end
