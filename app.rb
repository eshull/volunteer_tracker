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

get ('/project/:id') do
  @project = params.fetch("id")
  new_project = Project.new({:title => @title, :id => @project})
  new_project.save
  @project = new_project
  erb(:project)
end

post ('/project/:id') do
  @project = params.fetch("id")
  @title = params.fetch("edit_project")
  new_project = Project.new({:title => @title, :id => @project})
  new_project.save
  @project = new_project
  erb(:project)
end
