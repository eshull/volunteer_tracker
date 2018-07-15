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
  new_project = Project.find(params.fetch("id").to_i())
  new_project.save
  @project = new_project
  erb(:project)
end

patch ('/project/:id/edit') do
  # @project = params.fetch("id")
  # @project = Project.find(params.fetch("id").to_i())d
  new_title = params.fetch("edit_project")
  new_project = Project.new({:title => new_title, :id => @project})
  new_project.save
  @project = new_project
  erb(:project_edit)
end

get ("/project/:id/edit") do
  @project = Project.find(params.fetch("id").to_i())
  # id = params.fetch("id").to_i()
  # @project = Project.find(id)
  # binding.pry
  erb(:project_edit)
end

delete ("/project/:id/edit") do
  @project = Project.find(params.fetch("id").to_i())
  @project.delete()
  @projects = Project.all()
  erb(:index)
end
